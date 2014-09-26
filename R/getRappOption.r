#' @title
#' Get Rapp Option
#'
#' @description 
#' Retrieves option from the container stored at \code{options(".rapp")} or
#' any of it subcontainers based on a path-like identifier 
#' (e.g. \code{"container/subcontainer/option_name"}.
#' 
#' @details
#' Values for \code{id} are expected to be of structure \code{a/b/c/.../z},
#' i.e. being a path-like identifier with a slash used as separator. 
#' The identifier is transformed to \code{a$b$c$...$z} and then in turn to a
#' valid \emph{get} expression (\code{getOption(".rapp")$a$b$c$...$z}).
#'   	
#' @param id \strong{Signature argument}.
#'    Object containing path-like ID information.
#' @param strict \code{\link{logical}}. 
#'    \code{TRUE}: \code{id} pointing to a non-existing option triggers
#'    error; \code{FALSE}: \code{id} pointing to a non-existing option leads
#'    to return value \code{NULL}.
#' @template threedot
#' @example inst/examples/getRappOption.r
#' @seealso \code{
#'   	\link[rapptime]{getRappOption-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "getRappOption",
  signature = c(
    "id"
  ),
  def = function(
    id,
    strict = FALSE, 
    ...
  ) {
    standardGeneric("getRappOption")       
  }
)

#' @title
#' Get Rapp Option
#'
#' @description 
#' See generic: \code{\link[rapptime]{getRappOption}}
#'   	 
#' @inheritParams getRappOption
#' @param id \code{\link{character}}.
#' @return \code{\link{ANY}}. Option value or for non-existing option 
#'    (i.e. wrong \code{id}): \code{NULL} if \code{strict = FALSE} and an error
#'    if \code{strict = TRUE}.
#' @example inst/examples/getRappOption.r
#' @seealso \code{
#'    \link[rapptime]{getRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getRappOption", 
  signature = signature(
    id = "character"
  ), 
  definition = function(
    id,
    strict,
    ...
  ) {

  if (!length(id)) {
    if (!strict) {
      out <- NULL
    } else {
      rapptime::signalCondition(
        condition = "InvalidRappOption",
        msg = c(
          "Empty ID"
        ),
        ns = "rapptime",
        type = "error"
      )
    }
  } else {
    container <- getOption(".rapp")
    envir_name <- "container"
    
    path <- paste0("[[\"", gsub("/", "\"]][[\"", id), "\"]]")
    expr <- paste0(envir_name, path)
    out <- eval(parse(text = expr))
    if (is.null(out)) {
      if (!strict) {
        out <- out
      } else {
        rapptime::signalCondition(
          condition = "InvalidRappOption",
          msg = c(
            "Invalid rapp option",
            ID = id
          ),
          ns = "rapptime",
          type = "error"
        )
      }
    }
    
    ## Handler //
    out <- handleRappOptionReturn(value = out)
  }
  
  return(out)
    
  }
)
