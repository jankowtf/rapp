#' @title
#' Get Library
#'
#' @description 
#' Retrieves the library option.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/getLibrary.r
#' @seealso \code{
#'   	\link[rapp]{getLibrary-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getLibrary",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("getLibrary")       
  }
)

#' @title
#' Get Library
#'
#' @description 
#' See generic: \code{\link[rapp]{getLibrary}}
#'      
#' @inheritParams getLibrary
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/getLibrary.r
#' @seealso \code{
#'    \link[rapp]{getLibrary}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getLibrary", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  return(getRappOption(id = ".rte/lib", ...))
    
  }
)
