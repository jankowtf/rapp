#' @title
#' Check if Rapp Runtime Environment is Enabled
#'
#' @description 
#' Checks if the \code{rapp} runtime environment as established by 
#' \code{\link[runtimr]{ensureRuntimeEnvironment}} is enabled.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/isRappRuntimeEnvironment.r
#' @seealso \code{
#'   	\link[runtimr]{isRappRuntimeEnvironment-character-method},
#'    \link[runtimr]{ensureRuntimeEnvironment}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "isRappRuntimeEnvironment",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("isRappRuntimeEnvironment")       
  }
)

#' @title
#' Check if Rapp Runtime Environment is Enabled
#'
#' @description 
#' See generic: \code{\link[runtimr]{isRappRuntimeEnvironment}}
#'   	 
#' @inheritParams isRappRuntimeEnvironment
#' @param ns \code{\link{missing}}.
#' @return \code{\link{logical}}. \code{TRUE}: runtime enabled; \code{FALSE}:
#'    runtime not enabled.
#' @example inst/examples/isRappRuntimeEnvironment.r
#' @seealso \code{
#'    \link[runtimr]{isRappRuntimeEnvironment}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isRappRuntimeEnvironment", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  return(is.null(getOption(".rapp")))
    
  }
)
