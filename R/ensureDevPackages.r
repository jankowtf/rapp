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
#' using the value previously set by \code{\link[rapp.core.rte]{ensureRappHome}}. 
#' Any deviation from the default behavior might lead to inconsistencies in 
#' the runtime environment at this point.
#'   	
#' @param rapp_home \strong{Signature argument}.
#'    Object containing rapp home directory information.
#' @param runtime_stage \code{\link{character}}. 
#'    Development stage as returned by \code{\link{getRuntimeStage}}.
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
    "rapp_home"
  ),
  def = function(
    rapp_home = getRappOption(".rte/rapp_home", strict = TRUE),
    runtime_stage = getRappOption(".rte/runtime_stage", strict = TRUE),
    lib = getRappOption(".rte/lib", strict = TRUE),
    ...
  ) {
    standardGeneric("ensureDevPackages")       
  }
)

#' @title
#' Ensure Rapp Options for Specific rapp_home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureDevPackages}}
#'   	 
#' @inheritParams ensureDevPackages
#' @param rapp_home \code{\link{missing}}. Default rapp_home.
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
    rapp_home = "missing"
  ), 
  definition = function(
    rapp_home,
    runtime_stage,
    lib,
    ...
  ) {
  
  return(ensureDevPackages(
    rapp_home = rapp_home,
    runtime_stage = runtime_stage,
    lib = lib,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Options for Specific rapp_home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureDevPackages}}
#'      
#' @inheritParams ensureDevPackages
#' @param rapp_home \code{\link{character}}. Default rapp_home.
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
    rapp_home = "character"
  ), 
  definition = function(
    rapp_home,
    runtime_stage,
    lib,
    ...
  ) {
  
  runtime_stage <- match.arg(runtime_stage, c("dev", "test", "live"))    
  
  ensureRappHome(path = rapp_home)    
  setInternalRepositories()
  repos_global <- switch(
    runtime_stage,
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
  if (isPackageProject()) {
    no_require <- devtools::as.package(".")$package %in% 
        c("rapp.core.examples", "rapp.core.repos")
  } else {
    no_require <- FALSE
  }
  if (!no_require) {
    base::require("rapp.core.examples", lib.loc = lib)
  }
  if (!no_require) {
    base::require("rapp.core.repos", lib.loc = lib)
  }
  base::require("testthat", lib.loc = lib)
  
  return(TRUE)
  
  }
)
