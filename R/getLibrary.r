#' @title
#' Get Library
#'
#' @description 
#' Retrieves the library option.
#'   	
#' @param ctx \strong{Signature argument}.
#'    Object containing context information.
#' @template threedot
#' @example inst/examples/getLibrary.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{getLibrary-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getLibrary",
  signature = c(
    "ctx"
  ),
  def = function(
    ctx,
    ...
  ) {
    standardGeneric("getLibrary")       
  }
)

#' @title
#' Get Library
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getLibrary}}
#'      
#' @inheritParams getLibrary
#' @param ctx \code{\link{missing}}. Default ctx.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/getLibrary.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getLibrary}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getLibrary", 
  signature = signature(
    ctx = "missing"
  ), 
  definition = function(
    ctx,
    ...
  ) {
  
  return(getRappOption(id = ".rte/lib"))
    
  }
)
