#' @title
#' Set Namespace Rapp Option
#'
#' @description 
#' Sets namespace-specific \code{rapp} options. These are usually 
#' options associated to package projects or applications. 
#' See \code{\link[rapp.core.rte]{mergeNamespaceRappOptions}}.
#'   	
#' @details
#' Providing a value for \code{ns} but none for \code{id} sets an empty 
#' option container (e.g. \code{ns = "my.package"}).
#' Providing a value for \code{id} will result in the method setting 
#' an option based on the following ID path: \code{ns/id}, 
#' e.g. \code{"my.package/option_1"}.
#'     
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @param id \strong{Signature argument}.
#'    Object containing path-like ID information.
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @template threedot
#' @example inst/examples/setNamespaceRappOption.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{setNamespaceRappOption-character-character-ANY-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "setNamespaceRappOption",
  signature = c(
    "ns",
    "id",
    "value"
  ),
  def = function(
    ns = ifelse(isPackageProject(), devtools::as.package(x = ".")$package,
                 character()),
    id = character(),
    value,
    ...
  ) {
    standardGeneric("setNamespaceRappOption")       
  }
)

#' @title
#' Set Namespace Rapp Option
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setNamespaceRappOption}}
#'   	 
#' @inheritParams setNamespaceRappOption
#' @param ns \code{\link{missing}}. Default namespace.
#' @param id \code{\link{missing}}. Default ID.
#' @param value \code{\link{ANY}}
#' @return See method
#'    \code{\link[rapp.core.rte]{setNamespaceRappOption-character-character-ANY-method}}
#' @example inst/examples/setNamespaceRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setNamespaceRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setNamespaceRappOption", 
  signature = signature(
    ns = "missing",
    id = "missing",
    value = "ANY"
  ), 
  definition = function(
    ns,
    id,
    value,
    ...
  ) {
  
  return(setNamespaceRappOption(
    ns = ns, 
    id = id, 
    value = value,
    ...
  ))
    
  }
)

#' @title
#' Set Namespace Rapp Option
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setNamespaceRappOption}}
#'      
#' @inheritParams setNamespaceRappOption
#' @param ns \code{\link{character}}.
#' @param id \code{\link{missing}}.
#' @param value \code{\link{ANY}}
#' @return See method
#'    \code{\link[rapp.core.rte]{setNamespaceRappOption-character-character-ANY-method}}
#' @example inst/examples/setNamespaceRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setNamespaceRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setNamespaceRappOption", 
  signature = signature(
    ns = "character",
    id = "missing",
    value = "ANY"
  ), 
  definition = function(
    ns,
    id,
    value,
    ...
  ) {
  
  return(setNamespaceRappOption(
    ns = ns, 
    id = id, 
    value = new.env(),
    ...
  ))
    
  }
)

#' @title
#' Set Namespace Rapp Option
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{setNamespaceRappOption}}
#'      
#' @inheritParams setNamespaceRappOption
#' @param ns \code{\link{character}}. 
#' @param id \code{\link{character}}.
#' @param value \code{\link{ANY}}
#' @return See method
#'    \code{\link[rapp.core.rte]{setNamespaceRappOption-character-character-ANY-method}}
#' @example inst/examples/setNamespaceRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{setNamespaceRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "setNamespaceRappOption", 
  signature = signature(
    ns = "character",
    id = "character",
    value = "ANY"
  ), 
  definition = function(
    ns,
    id,
    value,
    ...
  ) {
  
  if (length(id)) {
    id <- file.path(ns, id)
  } else {
    id <- ns
  }
  return(setRappOption(id = id, value = value, ...))
    
  }
)

