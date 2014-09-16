#' @title
#' Set Rapp Home
#'
#' @description 
#' Sets the home directory associated to the \code{rapp}
#' framework and its associated packages to \code{.rte/rapp_global}.
#'   	
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @param update_dependent \code{\link{logical}}.
#'    \code{TRUE}: update dependent options; \code{FALSE}: dependent options 
#'    are not updated.
#' @template threedot
#' @example inst/examples/setRappGlobal.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{setRappGlobal-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "setRappGlobal",
  signature = c(
    "value"
  ),
  def = function(
    value = file.path(Sys.getenv("HOME"), "rapp"),
    update_dependent = FALSE,
    ...
  ) {
    standardGeneric("setRappGlobal")       
  }
)

#' @title
#' Set Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setRappGlobal}}
#'   	 
#' @inheritParams setRappGlobal
#' @param value \code{\link{missing}}. Default value (see generic).
#' @return See method
#'    \code{\link[rapp.core.rte]{setRappGlobal-character-method}}
#' @example inst/examples/setRappGlobal.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setRappGlobal}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setRappGlobal", 
  signature = signature(
    value = "missing"
  ), 
  definition = function(
    value,
    update_dependent,
    ...
  ) {
  
  return(setRappGlobal(
    value = value,
    update_dependent = update_dependent,
    ...
  ))
    
  }
)

#' @title
#' Set Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setRappGlobal}}
#'      
#' @inheritParams setRappGlobal
#' @param value \code{\link{character}}. Default value.
#' @return \code{\link{logical}}. Return value of 
#'    \code{\link[rapp.core.rte]{setRappOption}}.
#' @example inst/examples/setRappGlobal.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setRappGlobal}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setRappGlobal", 
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
    id = ".rte/rapp_global",
    value = value,
    branch_gap = TRUE
  )
  
  ## Update dependent options //
  if (update_dependent) {
    ensureRappGlobal(path = value)
  }
  
  return(out)
    
  }
)
