#' @title
#' Get Context-Specific Rapp Options
#'
#' @description 
#' Retrieves context-specific \code{rapp} options. These are usually 
#' options associated to package projects or applications. 
#' See \code{\link[rapp.core.rte]{ensureContextRappOptions}}.
#' 
#' @details
#' Providing a value for \code{ctx} but none for \code{id} retrieves the 
#' entire options container for the respective context (if it exists; e.g.
#' \code{ctx = "my.package"}).
#' Providing a value for \code{id} will result in the method looking for 
#' an option based on the following ID path: \code{ctx/id}, 
#' e.g. \code{"my.package/option_1"}.
#'   	
#' @param ctx \strong{Signature argument}.
#'    Object containing context information.
#' @param id \strong{Signature argument}.
#'    Object containing path-like ID information.
#' @template threedot
#' @example inst/examples/getContextRappOption.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{getContextRappOption-character-character-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getContextRappOption",
  signature = c(
    "ctx",
    "id"
  ),
  def = function(
    ctx = ifelse(isPackageProject(), devtools::as.package(x = ".")$package,
                 character()),
    id = character(),
    ...
  ) {
    standardGeneric("getContextRappOption")       
  }
)

#' @title
#' Get Context-Specific Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getContextRappOption}}
#'      
#' @inheritParams getContextRappOption
#' @param ctx \code{\link{missing}}. Default context.
#' @param id \code{\link{missing}}. Default ID.
#' @return See method 
#'   \code{\link[rapp.core.rte]{getContextRappOption-character-character-method}}
#' @example inst/examples/getContextRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getContextRappOption}
#' }
#' @template author
#' @template references
#' @export
#' @import rapp.core.condition
setMethod(
  f = "getContextRappOption", 
  signature = signature(
    ctx = "missing",
    id = "missing"
  ), 
  definition = function(
    ctx,
    id,
    ...
  ) {
  
  return(getContextRappOption(ctx = ctx, id = id, ...))
    
  }
)

#' @title
#' Get Context-Specific Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getContextRappOption}}
#'      
#' @inheritParams getContextRappOption
#' @param ctx \code{\link{character}}. Default context.
#' @param id \code{\link{missing}}. Default ID.
#' @return See method 
#'   \code{\link[rapp.core.rte]{getContextRappOption-character-character-method}}
#' @example inst/examples/getContextRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getContextRappOption}
#' }
#' @template author
#' @template references
#' @export
#' @import rapp.core.condition
setMethod(
  f = "getContextRappOption", 
  signature = signature(
    ctx = "character",
    id = "missing"
  ), 
  definition = function(
    ctx,
    id,
    ...
  ) {
  
  return(getContextRappOption(ctx = ctx, id = id, ...))
    
  }
)

#' @title
#' Get Context-Specific Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getContextRappOption}}
#'      
#' @inheritParams getContextRappOption
#' @param ctx \code{\link{character}}.
#' @param id \code{\link{character}}.
#' @return \code{\link{logical}}. Return value of 
#'    \code{\link[rapp.core.rte]{setRappOption}}.
#' @example inst/examples/getContextRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getContextRappOption}
#' }
#' @template author
#' @template references
#' @export
#' @import rapp.core.condition
setMethod(
  f = "getContextRappOption", 
  signature = signature(
    ctx = "character",
    id = "character"
  ), 
  definition = function(
    ctx,
    id,
    ...
  ) {
  
  if (length(id)) {
    id <- file.path(ctx, id)
  } else {
    id <- ctx
  }
  return(getRappOption(id = id))
   
  }
)


