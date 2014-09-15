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
#'          \code{runtime_stage} which in turn is stored in 
#'          the option environment \code{.DEVENV} associated to 
#'          option \code{".rapp"} (i.e. access via 
#'          \code{getOption(".rapp")$.RAPPDEVENV$.RAPPDEVENV_runtime_stage}).
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
#'   	
#' @param rapp_home \strong{Signature argument}.
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
#' @template threedot
#' @example inst/examples/ensureRappRuntimeEnvironment.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureRappRuntimeEnvironment-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "ensureRappRuntimeEnvironment",
  signature = c(
    "rapp_home"
  ),
  def = function(
    rapp_home = file.path(Sys.getenv("HOME"), "rapp"),
    runtime_stage = c("dev", "test", "live"),
    lib = .libPaths()[1],
    pkg = ifelse(isPackageProject(), devtools::as.package(x = ".")$package,
      character()),
    vsn = ifelse(isPackageProject(), devtools::as.package(x = ".")$version,
      character()),
    ...
  ) {
    standardGeneric("ensureRappRuntimeEnvironment")       
  }
)

#' @title
#' Ensure Development Environment
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappRuntimeEnvironment}}
#'      
#' @inheritParams ensureRappRuntimeEnvironment
#' @param rapp_home \code{\link{missing}}. Default rapp_home.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/ensureRappRuntimeEnvironment.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappRuntimeEnvironment}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRappRuntimeEnvironment", 
  signature = signature(
    rapp_home = "missing"
  ), 
  definition = function(
    rapp_home,
    runtime_stage,
    lib,
    pkg,
    vsn,
    ...
  ) {
  
  return(ensureRappRuntimeEnvironment(
    rapp_home = rapp_home,
    runtime_stage = runtime_stage, 
    lib = lib,
    pkg = pkg,
    vsn = vsn
  ))
    
  }
)

#' @title
#' Ensure Development Environment
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappRuntimeEnvironment}}
#'   	 
#' @inheritParams ensureRappRuntimeEnvironment
#' @param rapp_home \code{\link{character}}. Default rapp_home.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/ensureRappRuntimeEnvironment.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappRuntimeEnvironment}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRappRuntimeEnvironment", 
  signature = signature(
    rapp_home = "character"
  ), 
  definition = function(
    rapp_home,
    runtime_stage,
    lib,
    pkg,
    vsn,
    ...
  ) {
  
#   require("base")
#   require("utils")
#   if (interactive()) {
#     runtime_stage <- select.list(
#       choices = c("dev", "test", "live"),
#       preselect = "dev",
#       title = "Select development stage",
#       graphics = TRUE
#     )
#   } else {
#     runtime_stage <- "live"
#   }
    
  ensureInitialRappOptions()  
    
  setRappHome(value = rapp_home, update_dependent = TRUE)
#   ensureRappHome()
  setInternalRepositories(pkg = pkg, vsn = vsn)
  setRuntimeStage(value = runtime_stage)
  setLibrary(value = lib)
  
  ## Ensure development packages //
  ensureDevPackages(
    rapp_home = rapp_home,
    runtime_stage = runtime_stage,
    lib = lib
  )
  
  ## Project components //
  if (isPackageProject()) {
    rapp.core.examples::ensureExamplesDirectory()
    base::dir.create("man-roxygen", showWarnings = FALSE)
    base::dir.create("tests/testthat/data", recursive = TRUE, showWarnings = FALSE)
    base::dir.create("rapp", recursive = TRUE, showWarnings = FALSE)
    
    rapp.core.rte::ensureContextRappOptions()
  }

  ## Process repository data //
  processRepositoryData()

  ## Library //
  .libPaths(lib)

  return(TRUE)
    
  }
)
