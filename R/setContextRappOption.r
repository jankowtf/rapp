#' @title
#' Set Context-Specific Rapp Option
#'
#' @description 
#' Sets context-specific \code{rapp} options. These are usually 
#' options associated to package projects or applications. 
#' See \code{\link[rapp.core.rte]{ensureContextRappOptions}}.
#'   	
#' @details
#' Providing a value for \code{ctx} but none for \code{id} sets an empty 
#' option container (e.g. \code{ctx = "my.package"}).
#' Providing a value for \code{id} will result in the method setting 
#' an option based on the following ID path: \code{ctx/id}, 
#' e.g. \code{"my.package/option_1"}.
#'     
#' @param ctx \strong{Signature argument}.
#'    Object containing context information.
#' @param id \strong{Signature argument}.
#'    Object containing path-like ID information.
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @template threedot
#' @example inst/examples/setContextRappOption.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{setContextRappOption-character-character-ANY-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "setContextRappOption",
  signature = c(
    "ctx",
    "id",
    "value"
  ),
  def = function(
    ctx = ifelse(isPackageProject(), devtools::as.package(x = ".")$package,
                 character()),
    id = character(),
    value,
    ...
  ) {
    standardGeneric("setContextRappOption")       
  }
)

#' @title
#' Set Context-Specific Rapp Option
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setContextRappOption}}
#'   	 
#' @inheritParams setContextRappOption
#' @param ctx \code{\link{missing}}. Default context.
#' @param id \code{\link{missing}}. Default ID.
#' @param value \code{\link{ANY}}
#' @return See method
#'    \code{\link[rapp.core.rte]{setContextRappOption-character-character-ANY-method}}
#' @example inst/examples/setContextRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setContextRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setContextRappOption", 
  signature = signature(
    ctx = "missing",
    id = "missing",
    value = "ANY"
  ), 
  definition = function(
    ctx,
    id,
    value,
    ...
  ) {
  
  return(setContextRappOption(
    ctx = ctx, 
    id = id, 
    value = value,
    ...
  ))
    
  }
)

#' @title
#' Set Context-Specific Rapp Option
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setContextRappOption}}
#'      
#' @inheritParams setContextRappOption
#' @param ctx \code{\link{character}}.
#' @param id \code{\link{missing}}.
#' @param value \code{\link{ANY}}
#' @return See method
#'    \code{\link[rapp.core.rte]{setContextRappOption-character-character-ANY-method}}
#' @example inst/examples/setContextRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setContextRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setContextRappOption", 
  signature = signature(
    ctx = "character",
    id = "missing",
    value = "ANY"
  ), 
  definition = function(
    ctx,
    id,
    value,
    ...
  ) {
  
  return(setContextRappOption(
    ctx = ctx, 
    id = id, 
    value = new.env(),
    ...
  ))
    
  }
)

#' @title
#' Set Context-Specific Rapp Option
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setContextRappOption}}
#'      
#' @inheritParams setContextRappOption
#' @param ctx \code{\link{missing}}. Default context.
#' @param id \code{\link{missing}}. Default ID.
#' @param value \code{\link{ANY}}
#' @return See method
#'    \code{\link[rapp.core.rte]{setContextRappOption-character-character-ANY-method}}
#' @example inst/examples/setContextRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setContextRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setContextRappOption", 
  signature = signature(
    ctx = "character",
    id = "character",
    value = "ANY"
  ), 
  definition = function(
    ctx,
    id,
    value,
    ...
  ) {
  
  if (length(id)) {
    id <- file.path(ctx, id)
  } else {
    id <- ctx
  }
  return(setRappOption(id = id, value = value, ...))
    
  }
)

