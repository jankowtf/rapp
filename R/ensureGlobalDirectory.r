#' @title
#' Ensure Rapp Home
#'
#' @description 
#' Ensures existence of the home directory associated to the \code{rapp}
#' framework and its associated packages.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @template threedot
#' @example inst/examples/ensureGlobalDirectory.r
#' @seealso \code{
#'   	\link[runtimr]{ensureGlobalDirectory-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "ensureGlobalDirectory",
  signature = c(
    "path"
  ),
  def = function(
    path = getGlobalDirectory(strict = TRUE),
    ...
  ) {
    standardGeneric("ensureGlobalDirectory")       
  }
)

#' @title
#' Ensure Rapp Home
#'
#' @description 
#' See generic: \code{\link[runtimr]{ensureGlobalDirectory}}
#'   	 
#' @inheritParams ensureGlobalDirectory
#' @param path \code{\link{missing}}. Default path.
#' @return See method
#'    \code{\link[runtimr]{ensureGlobalDirectory-character-method}}
#' @example inst/examples/ensureGlobalDirectory.r
#' @seealso \code{
#'    \link[runtimr]{ensureGlobalDirectory}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureGlobalDirectory", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  return(ensureGlobalDirectory(
    path = path,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Home
#'
#' @description 
#' See generic: \code{\link[runtimr]{ensureGlobalDirectory}}
#'      
#' @inheritParams ensureGlobalDirectory
#' @param path \code{\link{character}}. Default path.
#' @return \code{\link{logical}}. \code{TRUE}
#' @example inst/examples/ensureGlobalDirectory.r
#' @seealso \code{
#'    \link[runtimr]{ensureGlobalDirectory}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureGlobalDirectory", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  if (!file.exists(dirname(path))) {
    runtimr::signalCondition(
      condition = "InvalidParentDirectory",
      msg = c(
        "Invalid parent directory for rapp HOME",
        Path = dirname(path)
      ),
      ns = "runtimr",
      type = "error"
    )
  }
  
  ## Ensure //
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  
  ## Components //
  dir.create(file.path(path, "ns"), recursive = TRUE, showWarnings = FALSE)
  
  return(TRUE)
    
  }
)
