#' @title
#' Create Package Project
#' 
#' @description 
#' Creates an slightly enhanced R package project as defined by the 
#' \code{rapp} framework.
#' 
#' @param id \strong{Signature argument}.
#'    Object containing package ID information.
#' @param path \strong{Signature argument}.
#'    Object containing location information.
#' @param overwrite \code{\link{logical}}.
#'    \code{TRUE}: overwrite existing package project;
#'    \code{FALSE}: error if package project already exists.
#' @param github_name \code{\link{character}}.
#'    User name at \href{http://github.com}{GitHub}. If not specified, it is
#'    automatically set to the maintainer information 
#'    \code{{firstname}{lastname}} as specified in the \code{DESCRIPTION} file.
#' @template threedot
#' @example inst/examples/createPackageProject.r
#' @seealso \code{
#'   	\link[rapp]{createPackageProject-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "createPackageProject",
  signature = c(
    "id",
    "path"
  ),
  def = function(
    id,
    path,
    overwrite = FALSE,
    github_name = NA_character_,
    ...
  ) {
    standardGeneric("createPackageProject")       
  }
)

#' @title
#' Create a New Application
#'
#' @description 
#' See generic: \code{\link[rapp]{createPackageProject}}
#'      
#' @inheritParams createPackageProject
#' @param id \code{\link{character}}. 
#' @param path \code{\link{character}}. 
#' @return \code{\link{character}}. Path to package directory. 
#' @example inst/examples/createPackageProject.r
#' @seealso \code{
#'    \link[rapp]{createPackageProject}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "createPackageProject", 
  signature = signature(
    id = "character",
    path = "character"
  ), 
  definition = function(
    id,
    path,
    overwrite,
    github_name,
    ...
  ) {
  
  ## Basic skeleton //
  createPackageSkeleton(id = id, path = path, overwrite = overwrite)
  
  ## Ensure components //
  ensureProjectComponents(path = file.path(path, id), github_name = github_name, 
                          overwrite = overwrite, strict = TRUE)
  
  return(file.path(path, id))

})
