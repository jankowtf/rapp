#' @title
#' Get Namespace Rapp Options
#'
#' @description 
#' Retrieves namespace-specific \code{rapp} options. These are usually 
#' options associated to package projects or applications. 
#' See \code{\link[rapp.core.rte]{mergeNamespaceRappOptions}}.
#' 
#' @details
#' Providing a value for \code{ns} but none for \code{id} retrieves the 
#' entire options container for the respective context (if it exists; e.g.
#' \code{ns = "my.package"}).
#' Providing a value for \code{id} will result in the method looking for 
#' an option based on the following ID path: \code{ns/id}, 
#' e.g. \code{"my.package/option_1"}.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @param id \strong{Signature argument}.
#'    Object containing path-like ID information.
#' @template threedot
#' @example inst/examples/getNamespaceRappOption.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{getNamespaceRappOption-character-character-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getNamespaceRappOption",
  signature = c(
    "ns",
    "id"
  ),
  def = function(
    ns = ifelse(isPackageProject(), devtools::as.package(x = ".")$package,
                 character()),
    id = character(),
    ...
  ) {
    standardGeneric("getNamespaceRappOption")       
  }
)

#' @title
#' Get Context-Specific Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getNamespaceRappOption}}
#'      
#' @inheritParams getNamespaceRappOption
#' @param ns \code{\link{missing}}. Default namespace.
#' @param id \code{\link{missing}}. Default ID.
#' @return See method 
#'   \code{\link[rapp.core.rte]{getNamespaceRappOption-character-character-method}}
#' @example inst/examples/getNamespaceRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getNamespaceRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getNamespaceRappOption", 
  signature = signature(
    ns = "missing",
    id = "missing"
  ), 
  definition = function(
    ns,
    id,
    ...
  ) {
  
  return(getNamespaceRappOption(ns = ns, id = id, ...))
    
  }
)

#' @title
#' Get Context-Specific Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getNamespaceRappOption}}
#'      
#' @inheritParams getNamespaceRappOption
#' @param ns \code{\link{character}}.
#' @param id \code{\link{missing}}. 
#' @return See method 
#'   \code{\link[rapp.core.rte]{getNamespaceRappOption-character-character-method}}
#' @example inst/examples/getNamespaceRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getNamespaceRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getNamespaceRappOption", 
  signature = signature(
    ns = "character",
    id = "missing"
  ), 
  definition = function(
    ns,
    id,
    ...
  ) {
  
  return(getNamespaceRappOption(ns = ns, id = id, ...))
    
  }
)

#' @title
#' Get Context-Specific Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getNamespaceRappOption}}
#'      
#' @inheritParams getNamespaceRappOption
#' @param ns \code{\link{missing}}.
#' @param id \code{\link{character}}. 
#' @return See method 
#'   \code{\link[rapp.core.rte]{getNamespaceRappOption-character-character-method}}
#' @example inst/examples/getNamespaceRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getNamespaceRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getNamespaceRappOption", 
  signature = signature(
    ns = "missing",
    id = "character"
  ), 
  definition = function(
    ns,
    id,
    ...
  ) {
  
  return(getNamespaceRappOption(ns = ns, id = id, ...))
    
  }
)

#' @title
#' Get Context-Specific Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{getNamespaceRappOption}}
#'      
#' @inheritParams getNamespaceRappOption
#' @param ns \code{\link{character}}.
#' @param id \code{\link{character}}.
#' @return \code{\link{logical}}. Return value of 
#'    \code{\link[rapp.core.rte]{setRappOption}}.
#' @example inst/examples/getNamespaceRappOption.r
#' @seealso \code{
#'    \link[rapp.core.rte]{getNamespaceRappOption}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getNamespaceRappOption", 
  signature = signature(
    ns = "character",
    id = "character"
  ), 
  definition = function(
    ns,
    id,
    ...
  ) {
  
  if (length(id)) {
    id <- file.path(ns, id)
  } else {
    id <- ns
  }
  return(getRappOption(id = id))
   
  }
)


