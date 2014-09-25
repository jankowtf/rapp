#' @title
#' Get Development Stage
#'
#' @description 
#' Retrieves the development stage option.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/getRuntimeMode.r
#' @seealso \code{
#'   	\link[runtimr]{getRuntimeMode-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getRuntimeMode",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("getRuntimeMode")       
  }
)

#' @title
#' Get Development Stage
#'
#' @description 
#' See generic: \code{\link[runtimr]{getRuntimeMode}}
#'      
#' @inheritParams getRuntimeMode
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/getRuntimeMode.r
#' @seealso \code{
#'    \link[runtimr]{getRuntimeMode}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getRuntimeMode", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  return(getRappOption(id = ".rte/runtime_mode", ...))
    
  }
)
