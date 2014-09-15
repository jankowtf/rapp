#' @title
#' Check if Rapp Runtime Environment is Enabled
#'
#' @description 
#' Checks if the \code{rapp} runtime environment as established by 
#' \code{\link[rapp.core.rte]{ensureRappRuntimeEnvironment}} is enabled.
#'   	
#' @param ctx \strong{Signature argument}.
#'    Object containing context information.
#' @template threedot
#' @example inst/examples/isRappRuntimeEnvironment.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{isRappRuntimeEnvironment-character-method},
#'    \link[rapp.core.rte]{ensureRappRuntimeEnvironment}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "isRappRuntimeEnvironment",
  signature = c(
    "ctx"
  ),
  def = function(
    ctx,
    ...
  ) {
    standardGeneric("isRappRuntimeEnvironment")       
  }
)

#' @title
#' Check if Rapp Runtime Environment is Enabled
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{isRappRuntimeEnvironment}}
#'   	 
#' @inheritParams isRappRuntimeEnvironment
#' @param ctx \code{\link{missing}}.
#' @return \code{\link{logical}}. \code{TRUE}: runtime enabled; \code{FALSE}:
#'    runtime not enabled.
#' @example inst/examples/isRappRuntimeEnvironment.r
#' @seealso \code{
#'    \link[rapp.core.rte]{isRappRuntimeEnvironment}
#' }
#' @template author
#' @template references
#' @export
#' @import rapp.core.condition
setMethod(
  f = "isRappRuntimeEnvironment", 
  signature = signature(
    ctx = "missing"
  ), 
  definition = function(
    ctx,
    ...
  ) {
  
  return(is.null(getOption(".rapp")))
    
  }
)
