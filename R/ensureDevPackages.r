#' @title
#' Ensure Development Packages
#'
#' @description 
#' Ensures that most recent versions of the requirement development packages
#' are loaded.
#' 
#' @note
#' If you want to fully comply with the convenvtions of the \code{rapp} framework
#' and its associated packages and applications, to not provide an explicit
#' value for \code{repos_home}. This will trigger the default behavior of 
#' using the value previously set by \code{\link[rapp.core.rte]{ensureRappGlobal}}. 
#' Any deviation from the default behavior might lead to inconsistencies in 
#' the runtime environment at this point.
#'   	
#' @param rapp_global \strong{Signature argument}.
#'    Object containing rapp home directory information.
#' @param runtime_mode \code{\link{character}}. 
#'    Development stage as returned by \code{\link{getRuntimeMode}}.
#' @param lib \code{\link{character}}.
#'    Library to be used. Defaults to return value of \ode{\link{getLibrary}}.
#' @template threedot
#' @example inst/examples/ensureDevPackages.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureDevPackages-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "ensureDevPackages",
  signature = c(
    "rapp_global"
  ),
  def = function(
    rapp_global = getRappOption(".rte/rapp_global", strict = TRUE),
    runtime_mode = getRappOption(".rte/runtime_mode", strict = TRUE),
    lib = getRappOption(".rte/lib", strict = TRUE),
    ...
  ) {
    standardGeneric("ensureDevPackages")       
  }
)

#' @title
#' Ensure Rapp Options for Specific rapp_global
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureDevPackages}}
#'   	 
#' @inheritParams ensureDevPackages
#' @param rapp_global \code{\link{missing}}. Default rapp_global.
#' @return See method
#'    \code{\link[rapp.core.rte]{ensureDevPackages-character-method}}
#' @example inst/examples/ensureDevPackages.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureDevPackages}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureDevPackages", 
  signature = signature(
    rapp_global = "missing"
  ), 
  definition = function(
    rapp_global,
    runtime_mode,
    lib,
    ...
  ) {
  
  return(ensureDevPackages(
    rapp_global = rapp_global,
    runtime_mode = runtime_mode,
    lib = lib,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Options for Specific rapp_global
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureDevPackages}}
#'      
#' @inheritParams ensureDevPackages
#' @param rapp_global \code{\link{character}}. Default rapp_global.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/ensureDevPackages.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureDevPackages}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureDevPackages", 
  signature = signature(
    rapp_global = "character"
  ), 
  definition = function(
    rapp_global,
    runtime_mode,
    lib,
    ...
  ) {
  
  runtime_mode <- match.arg(runtime_mode, c("dev", "test", "live"))    
  
  ensureRappGlobal(path = rapp_global)    
  setInternalRepositories()
  repos_global <- switch(
    runtime_mode,
    "dev" = getRappOption(".rte/repos_dev_global"),
    "test" = getRappOption(".rte/repos_test_global"),
    "live" = getRappOption(".rte/repos_live_global")
  )
  
  # new.packages(lib.loc = lib, repos = repos_global)
  old_pkgs <- utils::old.packages(lib.loc = lib, repos = repos_global)
  # old_pkgs <- data.frame(Package = c("rapp.core.examples", "rapp.core.repos"),
  #                        stringsAsFactors = FALSE)
  if (length(old_pkgs)) {
    utils::install.packages(
      pkgs = old_pkgs[, "Package"],
      lib = lib,
      repos = repos_global
    )
  }
  
  ## Ensure packages //
#   if (isPackageProject()) {
#     no_require <- devtools::as.package(".")$package %in% 
#         c("rapp.core.examples", "rapp.core.repos")
#   } else {
#     no_require <- FALSE
#   }
#   if (!no_require) {
#     base::require("rapp.core.examples", lib.loc = lib)
#   }
#   if (!no_require) {
#     base::require("rapp.core.repos", lib.loc = lib)
#   }
  base::require("testthat", lib.loc = lib)
  
  return(TRUE)
  
  }
)
