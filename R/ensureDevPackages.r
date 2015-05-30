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
#' using the value previously set by \code{\link[rapp]{ensureGlobalDirectory}}. 
#' Any deviation from the default behavior might lead to inconsistencies in 
#' the runtime environment at this point.
#'   	
#' @param global_dir \strong{Signature argument}.
#'    Object containing rapp home directory information.
#' @param runtime_mode \code{\link{character}}. 
#'    Development stage as returned by \code{\link{getRuntimeMode}}.
#' @param lib \code{\link{character}}.
#'    Library to be used. Defaults to return value of \code{\link{getLibrary}}.
#' @template threedot
#' @example inst/examples/ensureDevPackages.r
#' @seealso \code{
#'   	\link[rapp]{ensureDevPackages-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import libr
setGeneric(
  name = "ensureDevPackages",
  signature = c(
    "global_dir"
  ),
  def = function(
    global_dir = getRappOption(".rte/global_dir", strict = TRUE),
    runtime_mode = getRappOption(".rte/runtime_mode", strict = TRUE),
    lib = getRappOption(".rte/lib", strict = TRUE),
    ...
  ) {
    standardGeneric("ensureDevPackages")       
  }
)

#' @title
#' Ensure Rapp Options for Specific global_dir
#'
#' @description 
#' See generic: \code{\link[rapp]{ensureDevPackages}}
#'   	 
#' @inheritParams ensureDevPackages
#' @param global_dir \code{\link{missing}}. Default global_dir.
#' @return See method
#'    \code{\link[rapp]{ensureDevPackages-character-method}}
#' @example inst/examples/ensureDevPackages.r
#' @seealso \code{
#'    \link[rapp]{ensureDevPackages}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureDevPackages", 
  signature = signature(
    global_dir = "missing"
  ), 
  definition = function(
    global_dir,
    runtime_mode,
    lib,
    ...
  ) {
  
  return(ensureDevPackages(
    global_dir = global_dir,
    runtime_mode = runtime_mode,
    lib = lib,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Options for Specific global_dir
#'
#' @description 
#' See generic: \code{\link[rapp]{ensureDevPackages}}
#'      
#' @inheritParams ensureDevPackages
#' @param global_dir \code{\link{character}}. Default global_dir.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/ensureDevPackages.r
#' @seealso \code{
#'    \link[rapp]{ensureDevPackages}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureDevPackages", 
  signature = signature(
    global_dir = "character"
  ), 
  definition = function(
    global_dir,
    runtime_mode,
    lib,
    ...
  ) {
  
  runtime_mode <- match.arg(runtime_mode, c("dev", "test", "live"))    
  
  ensureGlobalDirectory(path = global_dir)    
  setInternalRepositories()
  repos_global <- switch(
    runtime_mode,
    "dev" = getRappOption(".rte/repos_dev_global"),
    "test" = getRappOption(".rte/repos_test_global"),
    "live" = getRappOption(".rte/repos_live_global")
  )
  
  # new.packages(lib.loc = lib, repos = repos_global)
  old_pkgs <- utils::old.packages(lib.loc = lib, repos = repos_global)
  # old_pkgs <- data.frame(Package = c("examplr", "reposr"),
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
#         c("examplr", "reposr")
#   } else {
#     no_require <- FALSE
#   }
#   if (!no_require) {
#     base::require("examplr", lib.loc = lib)
#   }
#   if (!no_require) {
#     base::require("reposr", lib.loc = lib)
#   }
  
  require("packrat", lib.loc = lib)
  require("devtools", lib.loc = lib)
  base::require("testthat", lib.loc = lib)
  
  return(TRUE)
  
  }
)
