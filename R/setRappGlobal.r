#' @title
#' Set Rapp Home
#'
#' @description 
#' Sets the home directory associated to the \code{rapp}
#' framework and its associated packages to \code{.rte/global_dir}.
#'   	
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @param update_dependent \code{\link{logical}}.
#'    \code{TRUE}: update dependent options; \code{FALSE}: dependent options 
#'    are not updated.
#' @template threedot
#' @example inst/examples/setGlobalDirectory.r
#' @seealso \code{
#'   	\link[rapp]{setGlobalDirectory-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import libr
setGeneric(
  name = "setGlobalDirectory",
  signature = c(
    "value"
  ),
  def = function(
    value = file.path(Sys.getenv("HOME"), "rapp"),
    update_dependent = FALSE,
    ...
  ) {
    standardGeneric("setGlobalDirectory")       
  }
)

#' @title
#' Set Rapp Home
#'
#' @description 
#' See generic: \code{\link[rapp]{setGlobalDirectory}}
#'   	 
#' @inheritParams setGlobalDirectory
#' @param value \code{\link{missing}}. Default value (see generic).
#' @return See method
#'    \code{\link[rapp]{setGlobalDirectory-character-method}}
#' @example inst/examples/setGlobalDirectory.r
#' @seealso \code{
#'    \link[rapp]{setGlobalDirectory}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setGlobalDirectory", 
  signature = signature(
    value = "missing"
  ), 
  definition = function(
    value,
    update_dependent,
    ...
  ) {
  
  return(setGlobalDirectory(
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
#' See generic: \code{\link[rapp]{setGlobalDirectory}}
#'      
#' @inheritParams setGlobalDirectory
#' @param value \code{\link{character}}. Default value.
#' @return \code{\link{logical}}. Return value of 
#'    \code{\link[rapp]{setRappOption}}.
#' @example inst/examples/setGlobalDirectory.r
#' @seealso \code{
#'    \link[rapp]{setGlobalDirectory}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setGlobalDirectory", 
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
    id = ".rte/global_dir",
    value = value,
    branch_gap = TRUE
  )
  
  ## Update dependent options //
  if (update_dependent) {
    ensureGlobalDirectory(path = value)
  }
  
  return(out)
    
  }
)
