#' @title
#' Set Library
#'
#' @description 
#' Sets the package library option \code{.rte/lib}.
#'   	
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @param update_dependent \code{\link{logical}}.
#'    \code{TRUE}: update dependent options; \code{FALSE}: dependent options 
#'    are not updated.
#' @template threedot
#' @example inst/examples/setLibrary.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{setLibrary-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "setLibrary",
  signature = c(
    "value"
  ),
  def = function(
    value = .libPaths()[1],
    update_dependent = FALSE,
    ...
  ) {
    standardGeneric("setLibrary")       
  }
)

#' @title
#' Set Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setLibrary}}
#'   	 
#' @inheritParams setLibrary
#' @param value \code{\link{missing}}. Default value.
#' @return See method
#'    \code{\link[rapp.core.rte]{setLibrary-character-method}}
#' @example inst/examples/setLibrary.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setLibrary}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setLibrary", 
  signature = signature(
    value = "missing"
  ), 
  definition = function(
    value,
    update_dependent,
    ...
  ) {
  
  return(setLibrary(
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
#' See generic: \code{\link[rapp.core.rte]{setLibrary}}
#'      
#' @inheritParams setLibrary
#' @param value \code{\link{character}}. Default value.
#' @return \code{\link{logical}}. Return value of 
#'    \code{\link[rapp.core.rte]{setRappOption}}.
#' @example inst/examples/setLibrary.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setLibrary}
#' }
#' @template author
#' @template references
#' @export
#' @import rapp.core.condition
setMethod(
  f = "setLibrary", 
  signature = signature(
    value = "character"
  ), 
  definition = function(
    value,
    update_dependent,
    ...
  ) {
  
  ## Set option //
  out <- setRappOption(
    id = ".rte/lib",
    value = value,
    branch_gap = TRUE
  )
  
  ## Update dependent options //
  if (update_dependent) {
    
  }
  
  return(out)
    
  }
)
