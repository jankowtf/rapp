#' @title
#' Get Development Stage
#'
#' @description 
#' Retrieves the development stage option.
#'   	
#' @param ctx \strong{Signature argument}.
#'    Object containing context information.
#' @template threedot
#' @example inst/examples/getRuntimeStage.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{getRuntimeStage-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getRuntimeStage",
  signature = c(
    "ctx"
  ),
  def = function(
    ctx,
    ...
  ) {
    standardGeneric("getRuntimeStage")       
  }
)

#' @title
#' Get Development Stage
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getRuntimeStage}}
#'      
#' @inheritParams getRuntimeStage
#' @param ctx \code{\link{missing}}. Default ctx.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/getRuntimeStage.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getRuntimeStage}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getRuntimeStage", 
  signature = signature(
    ctx = "missing"
  ), 
  definition = function(
    ctx,
    ...
  ) {
  
  return(getRappOption(id = ".rte/runtime_stage", ...))
    
  }
)
