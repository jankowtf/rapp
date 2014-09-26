#' @title
#' Ensure Rapp Option Files
#'
#' @description 
#' Ensures option files \code{options_runtime.r} and \code{options_rapp.r} 
#' associated to the \code{rapp} framework.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing parent directory path information.
#' @param overwrite \code{\link{logical}}.
#'    \code{TRUE}: overwrite existing option files;
#'    \code{FALSE}: do not overwrite existing option files.
#' @template threedot
#' @example inst/examples/ensureRappOptionFiles.r
#' @seealso \code{
#'   	\link[rapptime]{ensureRappOptionFiles-missing-method}
#' }
#' @template author
#' @template references
setGeneric(
  name = "ensureRappOptionFiles",
  signature = c(
    "path"
  ),
  def = function(
    path = "options",
    overwrite = FALSE,
    ...
  ) {
    standardGeneric("ensureRappOptionFiles")       
  }
)

#' @title
#' Ensure Rapp Option Files
#'
#' @description 
#' See generic: \code{\link[rapptime]{ensureRappOptionFiles}}
#'   	 
#' @inheritParams ensureRappOptionFiles
#' @param path \code{\link{missing}}. 
#' @return See method 
#'    \code{\link[rapptime]{ensureRappOptionFiles-character-method}}. 
#' @example inst/examples/ensureRappOptionFiles.r
#' @seealso \code{
#'    \link[rapptime]{ensureRappOptionFiles}
#' }
#' @template author
#' @template references
#' @import rapp.core.package
setMethod(
  f = "ensureRappOptionFiles", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    overwrite,
    ...
  ) {
      
  return(ensureRappOptionFiles(
    path = path,
    overwrite = overwrite,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Option Files
#'
#' @description 
#' See generic: \code{\link[rapptime]{ensureRappOptionFiles}}
#'      
#' @inheritParams ensureRappOptionFiles
#' @param path \code{\link{character}}. 
#' @return \code{\link{character}}. Paths to the option files whose existence has 
#'    been ensured. 
#' @example inst/examples/ensureRappOptionFiles.r
#' @seealso \code{
#'    \link[rapptime]{ensureRappOptionFiles}
#' }
#' @template author
#' @template references
#' @import rapp.core.package
setMethod(
  f = "ensureRappOptionFiles", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    overwrite,
    ...
  ) {
      
  expr <- substitute(
    list(
      global_dir = file.path(Sys.getenv("HOME"), "rapp"),
      wd = getwd(),
      runtime_mode = "dev",
      lib = .libPaths()[1]
    )
  )    
  path_opts_runtime <- file.path(path, "options_runtime.r")
  write(rapptime::tidySource(input = expr, name = "options"), 
    file = path_opts_runtime)
  expr <- substitute(
    list(
      ns = rapp.core.package::asPackage(x = ".")$package, ## Primary key for runtime --> do not change this!
      global_dir = file.path(Sys.getenv("HOME"), "rapp/ns", 
                             rapp.core.package::asPackage(x = ".")$package),
      option_1 = "your option value here (can be any R object)",
      option_2 = "your option value here (can be any R object)",
      option_3 = "your option value here (can be any R object)"
    )
  )
  path_opts_rapp <- file.path(path, "options_rapp.r")
  write(rapptime::tidySource(input = expr, name = "options"), 
    file = path_opts_rapp)
  out <- c(path_opts_runtime, path_opts_rapp)
  
  return(out)
  
  }
)
