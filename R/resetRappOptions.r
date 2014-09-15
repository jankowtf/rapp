#' @title
#' Reset Rapp Options
#'
#' @description 
#' Resets options as expected by the \code{rapp} framework and its associated
#' packages.
#'   	
#' @param ctx \strong{Signature argument}.
#'    Object containing ctx information.
#' @template threedot
#' @example inst/examples/resetRappOptions.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{resetRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "resetRappOptions",
  signature = c(
    "ctx"
  ),
  def = function(
    ctx,
    ...
  ) {
    standardGeneric("resetRappOptions")       
  }
)

#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{resetRappOptions}}
#'   	 
#' @inheritParams resetRappOptions
#' @param ctx \code{\link{missing}}. Default context.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/resetRappOptions.r
#' @seealso \code{
#'    \link[rapp.core.rte]{resetRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "resetRappOptions", 
  signature = signature(
    ctx = "missing"
  ), 
  definition = function(
    ctx,
    ...
  ) {
  
  return(ensureInitialRappOptions())
    
  }
)
