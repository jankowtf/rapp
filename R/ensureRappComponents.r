#' @title
#' Ensure Rapp Directory Components
#'
#' @description 
#' Ensures certain components of the \code{rapp} directory of a package project.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @param overwrite \code{\link{logical}}.
#'    \code{TRUE}: overwrite existing directory components;
#'    \code{FALSE}: do not overwrite existing directory components.
#' @template threedot
#' @example inst/examples/ensureRappComponents.r
#' @seealso \code{
#'   	\link[runtimr]{ensureRappComponents-missing-method}
#' }
#' @template author
#' @template references
setGeneric(
  name = "ensureRappComponents",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    overwrite = FALSE,
    ...
  ) {
    standardGeneric("ensureRappComponents")       
  }
)

#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' See generic: \code{\link[runtimr]{ensureRappComponents}}
#'   	 
#' @inheritParams ensureRappComponents
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureRappComponents.r
#' @seealso \code{
#'    \link[runtimr]{ensureRappComponents}
#' }
#' @template author
#' @template references
#' @import rapp.core.package
setMethod(
  f = "ensureRappComponents", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    overwrite,
    ...
  ) {
    
  if (isPackageProject()) {
    dirs <- c(
      "apps",
      "options"
    )
    sapply(dirs, dir.create, recursive = TRUE, showWarnings = FALSE)

    ## Create test rapp //
    createRapp(id = "test", path = "apps")
    
    expr <- substitute(
      list(
        global_dir = file.path(Sys.getenv("HOME"), "rapp"),
        runtime_mode = "dev",
        lib = .libPaths()[1],
        wd = getwd()
      )
    )    
    write(runtimr::tidySource(input = expr, name = "options_runtime"), 
      file = "options/options_runtime.r")
    expr <- substitute(
      list(
        ns = rapp.core.package::asPackage(x = ".")$package, ## Primary key for runtime --> do not change this!
        option_1 = "your option value here (can be any R object)",
        option_2 = "your option value here (can be any R object)",
        option_3 = "your option value here (can be any R object)"
      )
    )
    write(runtimr::tidySource(input = expr, name = "options_runtime"), 
      file = "options/options_rapp.r")
    
    ## Rapp info file //
    vsn <- unname(read.dcf(system.file("DESCRIPTION"), field = "Version")[,1])
    rapp_info <- list(version = vsn)
    write.dcf(as.data.frame(rapp_info), file = ".rapp")
    
    out <- TRUE
  } else {
    out <- FALSE
  }
  
  return(out)
    
  }
)
