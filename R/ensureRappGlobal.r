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
#' @example inst/examples/ensureRappGlobal.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureRappGlobal-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "ensureRappGlobal",
  signature = c(
    "path"
  ),
  def = function(
    path = getRappGlobal(strict = TRUE),
    ...
  ) {
    standardGeneric("ensureRappGlobal")       
  }
)

#' @title
#' Ensure Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappGlobal}}
#'   	 
#' @inheritParams ensureRappGlobal
#' @param path \code{\link{missing}}. Default path.
#' @return See method
#'    \code{\link[rapp.core.rte]{ensureRappGlobal-character-method}}
#' @example inst/examples/ensureRappGlobal.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappGlobal}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRappGlobal", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  return(ensureRappGlobal(
    path = path,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappGlobal}}
#'      
#' @inheritParams ensureRappGlobal
#' @param path \code{\link{character}}. Default path.
#' @return \code{\link{logical}}. \code{TRUE}
#' @example inst/examples/ensureRappGlobal.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappGlobal}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRappGlobal", 
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
  dir.create(file.path(path, "ns"), recursive = TRUE, showWarnings = FALSE)
  
  return(TRUE)
    
  }
)
