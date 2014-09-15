#' @title
#' Set Global Repository Options
#'
#' @description 
#' Sets that internal repository options are set.
#' 
#' @note
#' If you want to fully comply with the convenvtions of the \code{rapp} framework
#' and its associated packages and applications, to not provide an explicit
#' value for \code{repos_root}. This will trigger the default behavior of 
#' placing the repository root under \code{<rapp-home>/repos/r} with 
#' \code{<rapp-home>} being the \code{rapp HOME} directory as set by 
#' \code{\link[rapp.core.rte]{ensureRappHome}}. 
#' Any deviation from the default behavior might lead to inconsistencies in 
#' the runtime environment at this point.
#'   	
#' @param repos_root \strong{Signature argument}.
#'    Object containing repos_root information.
#' @param runtime_stage \code{\link{character}}.
#'    Development stage. Any of \code{c("dev", "test", "live")}.
#' @param pkg \code{\link{character}}. Package name.
#' @param vsn \code{\link{character}}. Package version.
#' @template threedot
#' @example inst/examples/setInternalRepositories.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{setInternalRepositories-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "setInternalRepositories",
  signature = c(
    "repos_root"
  ),
  def = function(
    repos_root = file.path(getRappOption(".rte/rapp_home", strict = TRUE), 
                           "repos/r"),
    runtime_stage = c("dev", "test", "live"),
    pkg = ifelse(isPackageProject(), devtools::as.package(x = ".")$package,
      character()),
    vsn = ifelse(isPackageProject(), devtools::as.package(x = ".")$version,
      character()),
    ...
  ) {
    standardGeneric("setInternalRepositories")       
  }
)

#' @title
#' Set Global Repository Options
#' 
#' @description 
#' Sets that internal repository options are set.
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setInternalRepositories}}
#'   	 
#' @inheritParams setInternalRepositories
#' @param repos_root \code{\link{missing}}. Default repos_root.
#' @return See method
#'    \code{\link[rapp.core.rte]{setInternalRepositories-character-method}}
#' @example inst/examples/setInternalRepositories.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setInternalRepositories}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setInternalRepositories", 
  signature = signature(
    repos_root = "missing"
  ), 
  definition = function(
    repos_root,
    runtime_stage,
    pkg, 
    vsn,
    ...
  ) {
  
  return(setInternalRepositories(
    repos_root = repos_root,
    runtime_stage = runtime_stage,
    pkg = pkg,
    vsn = vsn,
    ...
  ))
    
  }
)

#' @title
#' Set Rapp Options for Specific repos_root
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setInternalRepositories}}
#'      
#' @inheritParams setInternalRepositories
#' @param repos_root \code{\link{character}}. Default repos_root.
#' @return \code{\link{logical}}. Vector with options settings result as 
#'    returned by \code{\link[rapp.core.rte]{setRappOption}}.
#' @example inst/examples/setInternalRepositories.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setInternalRepositories}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setInternalRepositories", 
  signature = signature(
    repos_root = "character"
  ), 
  definition = function(
    repos_root,
    runtime_stage,
    pkg,
    vsn,
    ...
  ) {
  
  runtime_stages <- c("dev", "test", "live")  
  runtime_stage <- match.arg(runtime_stage, runtime_stages)
  repos_list_0 <- file.path(repos_root, runtime_stages)
  repos_list <- file.path("file://", repos_list_0)
  repos_list_global <- file.path(repos_list, "global")  
  repos_list_pkgs <- file.path(repos_list, "packages")  
  
  out <- NULL
  out <- c(out, "repos_root" = setRappOption(
    id = ".rte/repos_root",
    value = repos_root,
    branch_gap = TRUE
  ))
  out <- c(out, "repos_dev_global" = setRappOption(
    id = ".rte/repos_dev_global",
    value = repos_list_global[1],
    branch_gap = TRUE
  ))
  out <- c(out, "repos_test_global" = setRappOption(
    id = ".rte/repos_test_global",
    value = repos_list_global[2],
    branch_gap = TRUE
  ))
  out <- c(out, "repos_live_global" = setRappOption(
    id = ".rte/repos_live_global",
    value = repos_list_global[3],
    branch_gap = TRUE
  ))
  out <- c(out, "repos_dev_pkgs" = setRappOption(
    id = ".rte/repos_dev_pkgs",
    value = repos_list_pkgs[1],
    branch_gap = TRUE
  ))
  out <- c(out, "repos_test_pkgs" = setRappOption(
    id = ".rte/repos_test_pkgs",
    value = repos_list_pkgs[2],
    branch_gap = TRUE
  ))
  out <- c(out, "repos_live_pkgs" = setRappOption(
    id = ".rte/repos_live_pkgs",
    value = repos_list_pkgs[3],
    branch_gap = TRUE
  ))
  
  ## Package-specific repositories (default values) //
  out <- c(out, "repos_dev_pkg" = setRappOption(
    id = ".rte/repos_dev_pkg",
    value = NA_character_,
    branch_gap = TRUE
  ))
  out <- c(out, "repos_test_pkg" = setRappOption(
    id = ".rte/repos_test_pkg",
    value = NA_character_,
    branch_gap = TRUE
  ))
  out <- c(out, "repos_live_pkg" = setRappOption(
    id = ".rte/repos_live_pkg",
    value = NA_character_,
    branch_gap = TRUE
  ))
  out <- c(out, "repos_pkg" = setRappOption(
    id = ".rte/repos_pkg",
    value = NA_character_,
    branch_gap = TRUE
  ))
  
  ## Global repository to be used //
  repos_global <- switch(
    runtime_stage,
    "dev" = getRappOption(".rte/repos_dev_global"),
    "test" = getRappOption(".rte/repos_test_global"),
    "live" = getRappOption(".rte/repos_live_global")
  )
  setRappOption(id = ".rte/repos_global", value = repos_global)
  
  ## Package-specific repositories //
  if (length(pkg) && length(vsn)) {
    repos_list_pkg <- file.path(repos_list_pkgs, file.path(pkg, vsn))
    out <- c(out, "repos_dev_pkg" = setRappOption(
      id = ".rte/repos_dev_pkg",
      value = repos_list_pkg[1],
      branch_gap = TRUE
    ))
    out <- c(out, "repos_test_pkg" = setRappOption(
      id = ".rte/repos_test_pkg",
      value = repos_list_pkg[2],
      branch_gap = TRUE
    ))
    out <- c(out, "repos_live_pkg" = setRappOption(
      id = ".rte/repos_live_pkg",
      value = repos_list_pkg[3],
      branch_gap = TRUE
    ))  
    
    repos_pkg <- switch(
      runtime_stage,
      "dev" = getRappOption(".rte/repos_dev_pkg"),
      "test" = getRappOption(".rte/repos_test_pkg"),
      "live" = getRappOption(".rte/repos_live_pkg")
    )
    setRappOption(id = ".rte/repos_pkg", value = repos_pkg)
  }
  
  return(out)
    
  }
)
