#' @title
#' Ensure Rapp Option Files
#'
#' @description 
#' Ensures option files \code{options_runtime.r} and \code{options_ns.r} 
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
#'   	\link[rapp]{ensureRappOptionFiles-missing-method}
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
#' See generic: \code{\link[rapp]{ensureRappOptionFiles}}
#'   	 
#' @inheritParams ensureRappOptionFiles
#' @param path \code{\link{missing}}. 
#' @return See method 
#'    \code{\link[rapp]{ensureRappOptionFiles-character-method}}. 
#' @example inst/examples/ensureRappOptionFiles.r
#' @seealso \code{
#'    \link[rapp]{ensureRappOptionFiles}
#' }
#' @template author
#' @template references
#' @import libr
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
#' See generic: \code{\link[rapp]{ensureRappOptionFiles}}
#'      
#' @inheritParams ensureRappOptionFiles
#' @param path \code{\link{character}}. 
#' @return \code{\link{character}}. Paths to the option files whose existence has 
#'    been ensured. 
#' @example inst/examples/ensureRappOptionFiles.r
#' @seealso \code{
#'    \link[rapp]{ensureRappOptionFiles}
#' }
#' @template author
#' @template references
#' @import libr
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
  if (!file.exists(path_opts_runtime) || overwrite) {
    write(rapp::tidySource(input = expr, name = "options"), 
      file = path_opts_runtime)
  }
  expr <- substitute(
    list(
      ns = libr::asPackage(x = ".")$package, ## Primary key for runtime --> do not change this!
      global_dir = file.path(Sys.getenv("HOME"), "rapp/ns", 
                             libr::asPackage(x = ".")$package),
      github_name = NA_character_,
      option_1 = "your option value here (can be any R object)",
      option_2 = "your option value here (can be any R object)",
      option_3 = "your option value here (can be any R object)"
    )
  )
  path_opts_rapp <- file.path(path, "options_ns.r")
  if (!file.exists(path_opts_rapp) || overwrite) {
    write(rapp::tidySource(input = expr, name = "options"), 
      file = path_opts_rapp)
  }
  
  out <- c(path_opts_runtime, path_opts_rapp)
  
  return(out)
  
  }
)
