#' @title
#' Set Rapp Option
#'
#' @description 
#' Sets option in the container stored at \code{options(".rapp")} or
#' any of it subcontainers based on a path-like identifier 
#' (e.g. \code{"container/subcontainer/option_name"}.
#' 
#' @details
#' Values for \code{id} are expected to be of structure \code{a/b/c/.../z},
#' i.e. being a path-like identifier with a slash used as separator. 
#' The identifier is transformed to \code{a$b$c$...$z} and then in turn to a
#' valid \code{assign} expression: 
#' \code{assign("z", value = value, envir = getOption(".rapp")$a$b$c$...)}.
#' 
#' @note
#' Note that if \code{id = "a/b/d"}, the mehtod expects there exists an 
#' environment at \code{getOption(".rapp")$a$b} (checked via 
#' \code{getRappOption(id = "a/b")}).
#'   	
#' @param id \strong{Signature argument}.
#'    Object containing path-like ID information.
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @param must_exist \code{\link{logical}}. 
#'    \code{TRUE}: \code{id} pointing to a non-existing option either triggers
#'    an error or results in return value \code{FALSE} (depending on \code{strict}); 
#'    \code{FALSE}: option that \code{id} points to is set.
#' @param match_class \code{\link{logical}}. 
#'    Implies that \code{must_exist} is automatically set to \code{TRUE}.
#'    \code{TRUE}: \code{class(value)} must match the class of the existing 
#'    option value; 
#'    \code{FALSE}: option that \code{id} points to is set without class check.
#' @param force_branch \code{\link{logical}}. 
#'    \code{TRUE}: when \code{dirname(id)} points to a leaf instead of a 
#'    branch (i.e. \code{dirname(id)} is not an \code{environment}), overwrite
#'    it to turn it into a branch;
#'    \code{FALSE}: either return with \code{FALSE} or throw error in such cases
#'    (depending on \code{strict}); 
#' @param branch_gap \code{\link{logical}}. 
#'    \code{TRUE}: when \code{dirname(id)} points to a non-existing parent
#'    branch or if there are any missing branches in the path tree, 
#'    then fill all missing branches; 
#'    \code{FALSE}: either return with \code{FALSE} or throw error in such cases
#'    (depending on \code{strict}); 
#' @param strict \code{\link{logical}}. 
#'    \code{TRUE}: \code{id} pointing to a non-existing option triggers
#'    error; \code{FALSE}: \code{id} pointing to a non-existing option leads
#'    to return value \code{NULL}.
#' @template threedot
#' @example inst/examples/setRappOption.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{setRappOption-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "setRappOption",
  signature = c(
    "id",
    "value"
  ),
  def = function(
    id,
    value,
    must_exist = FALSE, 
    match_class = FALSE,
    force_branch = FALSE,
    branch_gap = FALSE,
    strict = FALSE,
    ...
  ) {
    standardGeneric("setRappOption")       
  }
)

#' @title
#' Set Rapp Option
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setRappOption}}
#'   	 
#' @inheritParams setRappOption
#' @param id \code{\link{character}}.
#' @param value \code{\link{ANY}}.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/setRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setRappOption", 
  signature = signature(
    id = "character",
    value = "ANY"
  ), 
  definition = function(
    id,
    value,
    must_exist,
    match_class,
    force_branch,
    branch_gap,
    strict,
    ...
  ) {
    
  out <- TRUE
  container <- ensureRappOptionsContainer()
  
  ## Adjustments //
  if (match_class) {
    must_exist <- TRUE
  }
  
  ## Direct parent check //
  id_branch <- dirname(id)
  if (id_branch == ".") {
    value_branch <- container
  } else {
    value_branch <- tryCatch(
      getRappOption(id = id_branch, strict = FALSE),
      error = function(cond) {
        NULL
      }
    )
  }
  
  ## Parent gap //
  if (is.null(value_branch)) {
    if (branch_gap) {
      ## Check how much to fill //
      id_branch_spl <- unlist(strsplit(id_branch, split = "/"))
      id_branch_tree <- NULL
      expr_get <- NULL
      expr_set <- NULL
      for (ii in 1:length(id_branch_spl)) {
        expr_get <- c(expr_get, 
          paste0("container$", paste(id_branch_spl[1:ii], collapse = "$")))
        expr_set <- c(expr_set, 
          paste0("container$", paste(id_branch_spl[1:ii], collapse = "$"),
                 " <- new.env()"))
        id_branch_tree <- c(id_branch_tree, paste(id_branch_spl[1:ii], collapse = "/"))
      }
      
#       ii=expr_get[1]
      idx <- sapply(expr_get, function(ii) {
        tryCatch(
          {
            tmp <- switch(
              as.character(inherits(eval(parse(text = ii)), "environment")),
              "TRUE" = "yes",
              "FALSE" = "no"
            )
          },
          error = function(cond) {
            "error"
          }
        )
      }) 

      ## Invalid type branch(es) //
      if (any(idx == "no") & any(idx == "error")) {
        idx_no <- which(idx == "no")
        if (length(idx_no)) {
          if (force_branch) {
            setRappOption(
              id = id_branch_tree[idx_no],
              value = new.env()
            )
            idx <- idx[-idx_no]
            expr_set <- expr_set[-idx_no]
            idx[which(idx == "error")] <- "no"
          } else {
            if (!strict) {
              out <- FALSE
            } else {
              rapp.core.rte::signalCondition(
                condition = "InvalidBranchConstellation",
                msg = c(
                  "Parent branch is not an environment",
                  ID = id,
                  "ID branch" = id_branch_tree[idx_no]
                ),
                ns = "rapp.core.rte",
                type = "error"
              )  
            }
          }
        }
      }
      
      ## Non-existing branch(es) //
      idx_no <- which(idx == "no")
# idx_no <- idx_no[-1]
      if (out) {
        if (length(idx_no)) {
          run_scope <- idx_no[1]:length(expr_set)
#         } else {
#           run_scope <- 1:length(expr_set)
#         }
        
#         if (length(run_scope)) {
          sapply(run_scope, function(ii) {
            eval(parse(text = expr_set[ii]))
          })  
          value_branch <- getRappOption(id = id_branch, strict = FALSE)
        }
      }
    } else {
      if (!strict) {
        out <- FALSE
      } else {
        rapp.core.rte::signalCondition(
          condition = "InvalidBranchConstellation",
          msg = c(
            "Branch gap",
            ID = id
          ),
          ns = "rapp.core.rte",
          type = "error"
        )
      }
    }
  }
  if (!out) {
    return(out)
  }
  
  ## Parent is no environment //
  if (!inherits(value_branch, "environment")) {
    if (force_branch) {
      expr_set <- paste0("container$", gsub("/", "$", id_branch), " <- new.env()")
      eval(parse(text = expr_set))
    } else {
      if (!strict) {
        out <- FALSE
      } else {
        rapp.core.rte::signalCondition(
          condition = "InvalidBranchConstellation",
          msg = c(
            "Parent branch is not an environment",
            ID = id,
            "ID branch" = id_branch,
            "Class branch" = class(value_branch)
          ),
          ns = "rapp.core.rte",
          type = "error"
        )
      }
    }
  }
  if (!out) {
    return(out)
  }

  ## Must exist //
  if (must_exist) {
    if (!exists(basename(id), envir = value_branch, inherits = FALSE)) {
      if (!strict) {
        out <- FALSE
      } else {
        rapp.core.rte::signalCondition(
          condition = "OptionPrerequisitesNotMet",
          msg = c(
            "Option does not exist yet",
            ID = id
          ),
          ns = "rapp.core.rte",
          type = "error"
        )
      }
    }
  }
  if (!out) {
    return(out)
  }
  
  ## Match class //
  if (match_class) {
    value_0 <- get(basename(id), envir = value_branch, inherits = FALSE)
    cl_0 <- class(value_0)
    cl_1 <- class(value)
    if (!inherits(value_0, cl_1)) {
      if (!strict) {
        out <- FALSE
      } else {
        rapp.core.rte::signalCondition(
          condition = "OptionPrerequisitesNotMet",
          msg = c(
            "New value has invalid class",
            ID = id,
            "Class expected" = cl_0,
            "Class provided" = cl_1
          ),
          ns = "rapp.core.rte",
          type = "error"
        )
      }
    }
  }
  if (!out) {
    return(out)
  }

  path <- gsub("/", "$", id)
  expr <- paste0("container$", path, " <- value")
  eval(parse(text = expr))  
  return(out)
  
  }
)
