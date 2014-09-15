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
#' @example inst/examples/ensureRappHome.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureRappHome-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "ensureRappHome",
  signature = c(
    "path"
  ),
  def = function(
    path = getRappHome(strict = TRUE),
    ...
  ) {
    standardGeneric("ensureRappHome")       
  }
)

#' @title
#' Ensure Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappHome}}
#'   	 
#' @inheritParams ensureRappHome
#' @param path \code{\link{missing}}. Default path.
#' @return See method
#'    \code{\link[rapp.core.rte]{ensureRappHome-character-method}}
#' @example inst/examples/ensureRappHome.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappHome}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRappHome", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  return(ensureRappHome(
    path = path,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappHome}}
#'      
#' @inheritParams ensureRappHome
#' @param path \code{\link{character}}. Default path.
#' @return \code{\link{logical}}. \code{TRUE}
#' @example inst/examples/ensureRappHome.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappHome}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRappHome", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  if (!file.exists(dirname(path))) {
    rapp.core.rte::signalCondition(
      condition = "InvalidParentDirectory",
      msg = c(
        "Invalid parent directory for rapp HOME",
        Path = dirname(path)
      ),
      ns = "rapp.core.rte",
      type = "error"
    )
  }
  
  ## Ensure //
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  
  ## Components //
  dir.create(file.path(path, "contexts"), recursive = TRUE, showWarnings = FALSE)
  
  return(TRUE)
    
  }
)
