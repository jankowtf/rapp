#' @title
#' Initialize Namespace Rapp Options
#'
#' @description 
#' Ensures initial namespace options as expected by the \code{rapp} 
#' framework and its associated packages. 
#' The options are stored as \code{".rapp"} in \code{\link[base]{options}}.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/initializeNamespaceRappOptions.r
#' @seealso \code{
#'   	\link[runtimr]{initializeNamespaceRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "initializeNamespaceRappOptions",
  signature = c(
    "ns"
  ),
  def = function(
    ns = rapp.core.package::asPackage(x = ".")$package,
    ...
  ) {
    standardGeneric("initializeNamespaceRappOptions")       
  }
)

#' @title
#' Initialize Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[runtimr]{initializeNamespaceRappOptions}}
#'      
#' @inheritParams initializeNamespaceRappOptions
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/initializeNamespaceRappOptions.r
#' @seealso \code{
#'    \link[runtimr]{initializeNamespaceRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "initializeNamespaceRappOptions", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
    
  return(initializeNamespaceRappOptions(
    ns = ns, 
    ...
  ))
    
  }
)

#' @title
#' Initialize Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[runtimr]{initializeNamespaceRappOptions}}
#'   	 
#' @inheritParams initializeNamespaceRappOptions
#' @param ns \code{\link{character}}.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/initializeNamespaceRappOptions.r
#' @seealso \code{
#'    \link[runtimr]{initializeNamespaceRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "initializeNamespaceRappOptions", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  ## Ensure rapp options are set //
  container <- ensureRappOptionsContainer()
  
  setRappOption(
    id = ns,
    value = new.env()
  )
  setRappOption(
    id = file.path(ns, "ns"),
    value = ns
  )
  setRappOption(
    id = file.path(ns, "ns_global"),
    value = NA_character_
  )
  setRappOption(
    id = file.path(ns, "path_app"),
    value = NA_character_
  )
  
  return(container)
    
  }
)
