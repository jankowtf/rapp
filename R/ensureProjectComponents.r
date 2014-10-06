#' @title
#' Ensure Project Components
#'
#' @description 
#' Ensures certain project components as either required or recommended
#' in the context of R package development using \code{\link{devtools}} and the
#' \code{rapp} framework and its associated packages.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing namespace information.
#' @param github_name \code{\link{character}}.
#'    User name at \href{http://github.com}{GitHub}. If not specified, it is
#'    automatically set to the maintainer information 
#'    \code{{firstname}{lastname}} as specified in the \code{DESCRIPTION} file.
#' @param overwrite \code{\link{logical}}.
#'    \code{TRUE}: overwrite existing directory components;
#'    \code{FALSE}: do not overwrite existing directory components.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: an error is thrown if \code{path} does not correspond to the 
#'    directory path of a valid package project; 
#'    \code{FALSE}: \code{FALSE} is returned in such a case.
#' @template threedot
#' @example inst/examples/ensureProjectComponents.r
#' @seealso \code{
#'   	\link[rapp]{ensureProjectComponents-missing-method}
#' }
#' @template author
#' @template references
setGeneric(
  name = "ensureProjectComponents",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    github_name = NA_character_,
    overwrite = FALSE,
    strict = FALSE,
    ...
  ) {
    standardGeneric("ensureProjectComponents")       
  }
)

#' @title
#' Ensure Project Components
#'
#' @description 
#' See generic: \code{\link[rapp]{ensureProjectComponents}}
#'      
#' @inheritParams ensureProjectComponents
#' @param path \code{\link{missing}}. Current working directory.
#' @return See method
#'    \code{\link{ensureProjectComponents-character-method}}.
#' @example inst/examples/ensureProjectComponents.r
#' @seealso \code{
#'    \link[rapp]{ensureProjectComponents}
#' }
#' @template author
#' @template references
setMethod(
  f = "ensureProjectComponents", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    github_name,
    overwrite,
    strict,
    ...
  ) {
    
  return(ensureProjectComponents(
    path = path,
    github_name = github_name,
    overwrite = overwrite,
    strict = strict,
    ...
  ))    
    
  }
)

#' @title
#' Ensure Project Components
#'
#' @description 
#' See generic: \code{\link[rapp]{ensureProjectComponents}}
#'   	 
#' @inheritParams ensureProjectComponents
#' @param path \code{\link{character}}. 
#' @return \code{\link{logical}}. \code{TRUE}: project components successfully
#'    ensured; \code{FALSE}: project components could not be ensured.
#' @example inst/examples/ensureProjectComponents.r
#' @seealso \code{
#'    \link[rapp]{ensureProjectComponents}
#' }
#' @template author
#' @template references
setMethod(
  f = "ensureProjectComponents", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    github_name,
    overwrite,
    strict,
    ...
  ) {
    
  if (isPackageProject(path = path)) {
    ## Ensure subdirectories //
    base::dir.create(file.path(path, "tests/testthat/data"), 
                     recursive = TRUE, showWarnings = FALSE)
    ## TODO 2014-09-16: check what other components might make sense (dummy test files)
    ## TODO 2014-09-16: develop 'rapp.core.test' for ensuring unit tests
    base::dir.create(file.path(path, "vignettes"), 
                     recursive = TRUE, showWarnings = FALSE)
    
    examplr::ensureExamplesDirectory(
      path = file.path(path, "inst/examples")
    )
    ensureRoxygenTemplates(path = path, github_name = github_name)
    ensureRappComponents(path = path, github_name = github_name, 
                         overwrite = overwrite)
    out <- TRUE
  } else {
    if (!strict) {
      out <- FALSE
    } else {
      rapp::signalCondition(
        condition = "InvalidPackageProjectDirectory",
        msg = c(
          "Directory path does not correspond to a valid package project",
          Path = path
        ),
        ns = "rapp",
        type = "error"
      )
    }
  }
  
  return(out)
    
  }
)
