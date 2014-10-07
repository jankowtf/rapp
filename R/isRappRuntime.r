#' @title
#' Check if Rapp Runtime Environment is Enabled
#'
#' @description 
#' Checks if the \code{rapp} runtime environment as established by 
#' \code{\link[rapp]{ensureRappRuntime}} is enabled.
#'   	
#' @details
#' The check is performed based on a check if the option \code{".rapp"} 
#' exists/is set.
#'     
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/isRappRuntime.r
#' @seealso \code{
#'   	\link[rapp]{isRappRuntime-character-method},
#'    \link[rapp]{ensureRappRuntime}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "isRappRuntime",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("isRappRuntime")       
  }
)

#' @title
#' Check if Rapp Runtime Environment is Enabled
#'
#' @description 
#' See generic: \code{\link[rapp]{isRappRuntime}}
#'   	 
#' @inheritParams isRappRuntime
#' @param ns \code{\link{missing}}.
#' @return \code{\link{logical}}. \code{TRUE}: runtime enabled; \code{FALSE}:
#'    runtime not enabled.
#' @example inst/examples/isRappRuntime.r
#' @seealso \code{
#'    \link[rapp]{isRappRuntime}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isRappRuntime", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  return(!is.null(getOption(".rapp")))
    
  }
)
