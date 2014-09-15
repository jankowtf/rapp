#' @title
#' Set Development Stage 
#'
#' @description 
#' Sets the development stage option \code{.rte/runtime_stage}.
#'   	
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @param update_dependent \code{\link{logical}}.
#'    \code{TRUE}: update dependent options; \code{FALSE}: dependent options 
#'    are not updated.
#' @template threedot
#' @example inst/examples/setRuntimeStage.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{setRuntimeStage-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "setRuntimeStage",
  signature = c(
    "value"
  ),
  def = function(
    value = c("dev", "test", "live"),
    update_dependent = FALSE,
    ...
  ) {
    standardGeneric("setRuntimeStage")       
  }
)

#' @title
#' Set Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setRuntimeStage}}
#'   	 
#' @inheritParams setRuntimeStage
#' @param value \code{\link{missing}}. Default value.
#'    Corresponds to the first value of \code{c("dev", "test", "live")} 
#'    being used.
#' @return See method
#'    \code{\link[rapp.core.rte]{setRuntimeStage-character-method}}
#' @example inst/examples/setRuntimeStage.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setRuntimeStage}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setRuntimeStage", 
  signature = signature(
    value = "missing"
  ), 
  definition = function(
    value,
    update_dependent,
    ...
  ) {
  
  return(setRuntimeStage(
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
#' See generic: \code{\link[rapp.core.rte]{setRuntimeStage}}
#'      
#' @inheritParams setRuntimeStage
#' @param value \code{\link{character}}. Default value.
#' @return \code{\link{logical}}. Return value of 
#'    \code{\link[rapp.core.rte]{setRappOption}}.
#' @example inst/examples/setRuntimeStage.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setRuntimeStage}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setRuntimeStage", 
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
    id = ".rte/runtime_stage",
    value = value,
    branch_gap = TRUE
  )
  
  ## Update dependent options //
  if (update_dependent) {
    
  }
  
  return(out)
    
  }
)
