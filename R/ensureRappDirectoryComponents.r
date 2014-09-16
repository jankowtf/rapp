#' @title
#' Ensure Rapp Directory Components
#'
#' @description 
#' Ensures certain components of the \code{rapp} directory of a package project.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/ensureRappDirectoryComponents.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureRappDirectoryComponents-missing-method}
#' }
#' @template author
#' @template references
setGeneric(
  name = "ensureRappDirectoryComponents",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("ensureRappDirectoryComponents")       
  }
)

#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappDirectoryComponents}}
#'   	 
#' @inheritParams ensureRappDirectoryComponents
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureRappDirectoryComponents.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappDirectoryComponents}
#' }
#' @template author
#' @template references
#' @import rapp.core.package
setMethod(
  f = "ensureRappDirectoryComponents", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
    
  if (isPackageProject()) {
    ## Private function //
    
    .formatOptionFile <- function(x, name) {
      expr <- unlist(strsplit(deparse(x, control = NULL), split = ","))
      expr <- gsub("^\\s*$|(^\\s*(?=\\w))", "", expr, perl = TRUE)
      expr <- expr[(expr != "")]
      expr <- unlist(strsplit(expr, split = "(?<=list)\\(|\\)$", perl = TRUE))
      expr <- paste0(name, " <- ", expr[1], 
         "(\n\t", paste(expr[2:length(expr)], collapse=",\n\t"), "\n)")
      expr
    }
    
    dirs <- c(
      "rapp/.internal",
      "rapp/apps/test/options",
      "rapp/apps/test/R",
      "rapp/dev",
      "rapp/options"
    )
    sapply(dirs, dir.create, recursive = TRUE, showWarnings = FALSE)
    
    options_runtime <- substitute(
      list(
      rapp_home = RAPP_HOME,
      runtime_mode = "dev",
      lib = .libPaths()[1]
      ),
      list(
        RAPP_HOME = file.path(Sys.getenv("HOME"), "rapp")
      )
    )
#     write(deparse(options_runtime, control = NULL), file = "test.r")
#     formatR::tidy_source(
#       source = "test.r",
#       brace.newline = TRUE,
#       indent = 2,
#       file = "test2.r",
#       width.cutoff = 60
#     )
    
    fpaths <- c(
      "rapp/options/options_runtime.r",
      "rapp/apps/test/options/options_runtime.r"
    ) 
#     sapply(fpaths, file.exists)
    sapply(fpaths, function(ii) {
      write(
        .formatOptionFile(x = options_runtime, name = "options_runtime"), 
        file = ii
      )
    })

    options_app <- list(
      ns = rapp.core.package::asPackage(x = ".")$package,
      option_2 = "your option value here (can be any R object)",
      option_3 = "your option value here (can be any R object)"
    )
    fpaths <- c(
      "rapp/options/options.r",
      "rapp/apps/test/options/options.r"
    ) 
    sapply(fpaths, function(ii) {
      write(
        .formatOptionFile(x = options_app, name = "options"), 
        file = ii
      )
    })
    out <- TRUE
  } else {
    out <- FALSE
  }
  
  return(out)
    
  }
)
