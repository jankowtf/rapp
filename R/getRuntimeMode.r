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
#'   	\link[rapp]{getRuntimeMode-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import libr
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
#' See generic: \code{\link[rapp]{getRuntimeMode}}
#'      
#' @inheritParams getRuntimeMode
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/getRuntimeMode.r
#' @seealso \code{
#'    \link[rapp]{getRuntimeMode}
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
