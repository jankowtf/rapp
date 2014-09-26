#' @title
#' Reset Rapp Options
#'
#' @description 
#' Resets options as expected by the \code{rapp} framework and its associated
#' packages.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/resetRappOptions.r
#' @seealso \code{
#'   	\link[rapptime]{resetRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "resetRappOptions",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("resetRappOptions")       
  }
)

#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapptime]{resetRappOptions}}
#'   	 
#' @inheritParams resetRappOptions
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/resetRappOptions.r
#' @seealso \code{
#'    \link[rapptime]{resetRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "resetRappOptions", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  return(initializeRappOptions())
    
  }
)
