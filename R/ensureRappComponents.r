#' @title
#' Ensure Rapp Project Components
#'
#' @description 
#' Ensures certain components of the \code{rapp} directory of a package project.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing location information.
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
#' @example inst/examples/ensureRappComponents.r
#' @seealso \code{
#'   	\link[rapp]{ensureRappComponents-missing-method}
#' }
#' @template author
#' @template references
setGeneric(
  name = "ensureRappComponents",
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
    standardGeneric("ensureRappComponents")       
  }
)

#' @title
#' Ensure Rapp Project Components
#'
#' @description 
#' See generic: \code{\link[rapp]{ensureRappComponents}}
#'      
#' @inheritParams ensureRappComponents
#' @param path \code{\link{missing}}. Current working directory.
#' @return See method 
#'    \code{\link{ensureRappComponents-character-method}}.
#' @example inst/examples/ensureRappComponents.r
#' @seealso \code{
#'    \link[rapp]{ensureRappComponents}
#' }
#' @template author
#' @template references
#' @import libr
setMethod(
  f = "ensureRappComponents", 
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
    
  return(ensureRappComponents(
    path = path,
    github_name = github_name,
    overwrite = overwrite,
    strict = strict,
    ...
  ))  
    
  }
)

#' @title
#' Ensure Rapp Project Components
#'
#' @description 
#' See generic: \code{\link[rapp]{ensureRappComponents}}
#'   	 
#' @inheritParams ensureRappComponents
#' @param path \code{\link{character}}.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureRappComponents.r
#' @seealso \code{
#'    \link[rapp]{ensureRappComponents}
#' }
#' @template author
#' @template references
#' @import libr
setMethod(
  f = "ensureRappComponents", 
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
    dirs <- file.path(path, c(
      "apps",
      "options"
    ))
    sapply(dirs, dir.create, recursive = TRUE, showWarnings = FALSE)

    ## Create test rapp //
    createRappProject(
      id = "test", 
      path = file.path(path, "apps"), 
      github_name = github_name
    )
    
    ## Ensure option files //
    ensureRappOptionFiles(path = file.path(path, "options"))
    
    ## Rapp info file //
    vsn <- unname(read.dcf(system.file("DESCRIPTION", package = "rapp"),
      field = "Version")[,1])
    rapp_info <- list(version = vsn)
    write.dcf(as.data.frame(rapp_info), file = ".rapp")
    
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
