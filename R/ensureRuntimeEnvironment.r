#' @title
#' Ensure Rapp Runtime Environment
#'
#' @description 
#' Takes care of all necessary steps in order to establish a fully functional 
#' runtime environment for the development and deployment of \code{rapp}
#' packages and applications.
#' 
#' @details
#' 		The main aspects/steps are:
#'   	\itemize{
#'        \item{Set development stage variable}: } {
#'          Let's the developer choose the development stage: \emph{dev},
#'          \code{test} or \code{live}. The choice is stored in variable 
#'          \code{runtime_mode} which in turn is stored in 
#'          the option environment \code{.DEVENV} associated to 
#'          option \code{".rapp"} (i.e. access via 
#'          \code{getOption(".rapp")$.RAPPDEVENV$.RAPPDEVENV_runtime_mode}).
#'          The variable currently only controls the exact file path to the
#'          package repository root directory (\code{"*/repos_dev"},
#'          \code{"*/repos_test"} or \code{"*/repos_dev"}).
#'        }
#'        \item{Ensure latest development packages}: } {
#'          Ensures that the latest versions of development packages are loaded:
#'          \code{require("rapp.core.examples") (in order to being able to 
#'          ensure example files) and \code{require("rapp.core.repos")
#'          (in order to enable integration with the \code{rapp} framework's
#'          local repository conventions 
#'          (main function: \code{\link[rapp.core.repos]{buildIntoRepositoryInfrastructure}}).)
#'        }
#'        \item{\code{require("testthat")}: } {
#'          in order to manually run unit tests within the actual test files
#'        }
#'        \item{\code{Ensures package project components)}: } {
#'          Directory for example files (\code{inst/examples}), 
#'          directory for roxygen templates (\code{man-roxygen}), 
#'          directories for unit tests (\code{tests/testthat/data}) 
#'        }
#'     }
#' In case a file \code{options_runtime.r} exists in \code{/options/},
#' then it is parsed and if any of \code{global_dir}, \code{runtime_mode} 
#' or \code{lib} is specified, the default values from the generic function
#' are overwritten. Else the default values are used.
#'   	
#' @param global_dir \strong{Signature argument}.
#'    Object containing rapp HOME directory information.
#' @param repos_root \code{\link{character}}.
#'    Directory path of the local package repository \strong{root} directory,
#'    i.e. the directory that should contain the repository tiers for the 
#'    different devel stages.
#'    Recommended: \code{"<some-dir>/repos/r"}.
#'    This will result in the following directory structure:
#'    \code{<some-dir>/repos/r/dev}, \code{<some-dir>/repos/r/test},
#'    \code{<some-dir>/repos/r/live}. Each of these directories contains the
#'    subdirectories \code{global} and \code{packages}. See details.
#' @param lib \code{\link{character}}.
#'    Library to be used. Defaults to the first element of 
#'    \code{\link[base]{.libPaths()}}.
#' @param pkg \code{\link{character}}. Package name.
#' @param vsn \code{\link{character}}. Package version.
#' @param opts \code{\link{list}}.
#'    Optional possibility to pass along options as returned by 
#'    \code{\link[rapptime]{readRappOptionFile}}.
#'    Certain, but not all values, are stored in the options (has to to with
#'    explicit vs. implicit values). This feature has not reached release stage,
#'    so use with caution or not at all. 
#' @template threedot
#' @example inst/examples/ensureRuntimeEnvironment.r
#' @seealso \code{
#'   	\link[rapptime]{ensureRuntimeEnvironment-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "ensureRuntimeEnvironment",
  signature = c(
    "global_dir"
  ),
  def = function(
    global_dir = file.path(Sys.getenv("HOME"), "rapp"),
    runtime_mode = c("dev", "test", "live"),
    lib = .libPaths()[1],
    pkg = ifelse(isPackageProject(), devtools::as.package(x = ".")$package,
      character()),
    vsn = ifelse(isPackageProject(), devtools::as.package(x = ".")$version,
      character()),
    opts = list(),
    ...
  ) {
    standardGeneric("ensureRuntimeEnvironment")       
  }
)

#' @title
#' Ensure Development Environment
#'
#' @description 
#' See generic: \code{\link[rapptime]{ensureRuntimeEnvironment}}
#' 
#' @details
#' In case a file \code{options_runtime.r} exists in \code{/options/},
#' then it is parsed and if any of \code{global_dir}, \code{runtime_mode} 
#' or \code{lib} is specified, the default values from the generic function
#' are overwritten. Else the default values are used.
#'      
#' @inheritParams ensureRuntimeEnvironment
#' @param global_dir \code{\link{missing}}. Default rapp HOME directory location.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/ensureRuntimeEnvironment.r
#' @seealso \code{
#'    \link[rapptime]{ensureRuntimeEnvironment}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRuntimeEnvironment", 
  signature = signature(
    global_dir = "missing"
  ), 
  definition = function(
    global_dir,
    runtime_mode,
    lib,
    pkg,
    vsn,
    ...
  ) {
  
  ## Overwrite if option file exists //
  path <- "options/options_runtime.r"
  opts <- readRappOptionFile(path = path, strict = FALSE)
  if (length(opts)) {
    if ("global_dir" %in% names(opts)) {
      global_dir <- opts$global_dir
    }
    if ("runtime_mode" %in% names(opts)) {
      runtime_mode <- opts$runtime_mode
    }
    if ("lib" %in% names(opts)) {
      lib <- opts$lib
    }
  }
   
  return(ensureRuntimeEnvironment(
    global_dir = global_dir,
    runtime_mode = runtime_mode, 
    lib = lib,
    pkg = pkg,
    vsn = vsn,
    opts = opts,
    ...
  ))
    
  }
)

#' @title
#' Ensure Development Environment
#'
#' @description 
#' See generic: \code{\link[rapptime]{ensureRuntimeEnvironment}}
#'   	 
#' @inheritParams ensureRuntimeEnvironment
#' @param global_dir \code{\link{character}}. Default global_dir.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/ensureRuntimeEnvironment.r
#' @seealso \code{
#'    \link[rapptime]{ensureRuntimeEnvironment}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRuntimeEnvironment", 
  signature = signature(
    global_dir = "character"
  ), 
  definition = function(
    global_dir,
    runtime_mode,
    lib,
    pkg,
    vsn,
    opts,
    ...
  ) {
  
#   require("base")
#   require("utils")
#   if (interactive()) {
#     runtime_mode <- select.list(
#       choices = c("dev", "test", "live"),
#       preselect = "dev",
#       title = "Select development stage",
#       graphics = TRUE
#     )
#   } else {
#     runtime_mode <- "live"
#   }
    
  ## Initialize //    
  initializeRappOptions()  
# ls(getOption(".rapp"))
# ls(getOption(".rapp")$.rte)
  
  ## Global directory //
  setGlobalDirectory(value = global_dir, update_dependent = TRUE)
  ensureGlobalDirectory()
  
  ## Repositories //
  setInternalRepositories(pkg = pkg, vsn = vsn)
  
  ## Runtime mode //
  setRuntimeMode(value = runtime_mode)
  
  ## Package library //
  setLibrary(value = lib)
  .libPaths(lib)
  
  ## Project components //
  ensureProjectComponents()

  ## Ensure namespace option container for project options //
  if (isPackageProject() || hasOptionFile()) {
    initializeNamespaceRappOptions()
    mergeNamespaceRappOptions()
  } 

  ## Process repository data //
  processRepositoryData()

  ## Ensure development packages //
  ensureDevPackages(
    global_dir = global_dir,
    runtime_mode = runtime_mode,
    lib = lib
  )

  return(TRUE)
    
  }
)
