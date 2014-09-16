#' @title
#' Get Rapp Home
#'
#' @description 
#' Retrieves the option corresponding to the path of the home directory 
#' associated to the \code{rapp}
#' framework and its associated packages.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/getRappGlobal.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{getRappGlobal-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getRappGlobal",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("getRappGlobal")       
  }
)

#' @title
#' Get Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getRappGlobal}}
#'      
#' @inheritParams getRappGlobal
#' @param ns \code{\link{missing}}. Default ns.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/getRappGlobal.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getRappGlobal}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getRappGlobal", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  return(getRappOption(id = ".rte/rapp_global", ...))
    
  }
)
