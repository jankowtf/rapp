#' @title
#' Set Development Stage 
#'
#' @description 
#' Sets the development stage option \code{.rte/runtime_mode}.
#'   	
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @param update_dependent \code{\link{logical}}.
#'    \code{TRUE}: update dependent options; \code{FALSE}: dependent options 
#'    are not updated.
#' @template threedot
#' @example inst/examples/setRuntimeMode.r
#' @seealso \code{
#'   	\link[rapptime]{setRuntimeMode-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "setRuntimeMode",
  signature = c(
    "value"
  ),
  def = function(
    value = c("dev", "test", "live"),
    update_dependent = FALSE,
    ...
  ) {
    standardGeneric("setRuntimeMode")       
  }
)

#' @title
#' Set Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapptime]{setRuntimeMode}}
#'   	 
#' @inheritParams setRuntimeMode
#' @param value \code{\link{missing}}. Default value.
#'    Corresponds to the first value of \code{c("dev", "test", "live")} 
#'    being used.
#' @return See method
#'    \code{\link[rapptime]{setRuntimeMode-character-method}}
#' @example inst/examples/setRuntimeMode.r
#' @seealso \code{
#'    \link[rapptime]{setRuntimeMode}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setRuntimeMode", 
  signature = signature(
    value = "missing"
  ), 
  definition = function(
    value,
    update_dependent,
    ...
  ) {
  
  return(setRuntimeMode(
    value = value,
    update_dependent = update_dependent,
    ...
  ))
    
  }
)

#' @title
#' Set Rapp Options for Specific value
#'
#' @description 
#' See generic: \code{\link[rapptime]{setRuntimeMode}}
#'      
#' @inheritParams setRuntimeMode
#' @param value \code{\link{character}}. Default value.
#' @return \code{\link{logical}}. Return value of 
#'    \code{\link[rapptime]{setRappOption}}.
#' @example inst/examples/setRuntimeMode.r
#' @seealso \code{
#'    \link[rapptime]{setRuntimeMode}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setRuntimeMode", 
  signature = signature(
    value = "character"
  ), 
  definition = function(
    value,
    update_dependent,
    ...
  ) {
  
  value <- match.arg(value, c("dev", "test", "live"))  
  
  ## Set option //
  out <- setRappOption(
    id = ".rte/runtime_mode",
    value = value,
    branch_gap = TRUE
  )
  
  ## Update dependent options //
  if (update_dependent) {
    
  }
  
  return(out)
    
  }
)
