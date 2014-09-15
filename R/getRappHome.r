#' @title
#' Get Rapp Home
#'
#' @description 
#' Retrieves the option corresponding to the path of the home directory 
#' associated to the \code{rapp}
#' framework and its associated packages.
#'   	
#' @param ctx \strong{Signature argument}.
#'    Object containing context information.
#' @template threedot
#' @example inst/examples/getRappHome.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{getRappHome-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getRappHome",
  signature = c(
    "ctx"
  ),
  def = function(
    ctx,
    ...
  ) {
    standardGeneric("getRappHome")       
  }
)

#' @title
#' Get Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getRappHome}}
#'      
#' @inheritParams getRappHome
#' @param ctx \code{\link{missing}}. Default ctx.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/getRappHome.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getRappHome}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getRappHome", 
  signature = signature(
    ctx = "missing"
  ), 
  definition = function(
    ctx,
    ...
  ) {
  
  return(getRappOption(id = ".rte/rapp_home", ...))
    
  }
)
