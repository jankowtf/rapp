#' @title
#' Initialize Namespace Rapp Options
#'
#' @description 
#' Ensures initial namespace options as expected by the \code{rapp} 
#' framework and its associated packages. 
#' The options are stored as \code{".rapp"} in \code{\link[base]{options}}.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing location information. Typically, this corresponds
#'    to the directory path to an R package project or R application project.
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/initializeNsRappOptions.r
#' @seealso \code{
#'   	\link[rapp]{initializeNsRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import devtools
#' @import libr
setGeneric(
  name = "initializeNsRappOptions",
  signature = c(
    "path",
    "ns"
  ),
  def = function(
    path = ".",
    ns = if (isPackageProject(path)) {
      devtools::as.package(x = path)$package
    } else {
      libr::asPackage(x = path)$package
    },
    ...
  ) {
    standardGeneric("initializeNsRappOptions")       
  }
)

#' @title
#' Initialize Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{initializeNsRappOptions}}
#'      
#' @inheritParams initializeNsRappOptions
#' @param path \code{\link{missing}}. Current working directory.
#' @param ns \code{\link{missing}}. Default namespace.
#' @return See method
#'    \code{\link[rapp]{initializeNsRappOptions-character-character-method}}.
#' @example inst/examples/initializeNsRappOptions.r
#' @seealso \code{
#'    \link[rapp]{initializeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "initializeNsRappOptions", 
  signature = signature(
    path = "missing",
    ns = "missing"
  ), 
  definition = function(
    path,
    ns,
    ...
  ) {
    
  return(initializeNsRappOptions(
    path = path,
    ns = ns, 
    ...
  ))
    
  }
)

#' @title
#' Initialize Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{initializeNsRappOptions}}
#'      
#' @inheritParams initializeNsRappOptions
#' @param path \code{\link{character}}. 
#' @param ns \code{\link{missing}}. Default namespace.
#' @return See method
#'    \code{\link[rapp]{initializeNsRappOptions-character-character-method}}.
#' @example inst/examples/initializeNsRappOptions.r
#' @seealso \code{
#'    \link[rapp]{initializeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "initializeNsRappOptions", 
  signature = signature(
    path = "character",
    ns = "missing"
  ), 
  definition = function(
    path,
    ns,
    ...
  ) {
    
  return(initializeNsRappOptions(
    path = path,
    ns = ns, 
    ...
  ))
    
  }
)

#' @title
#' Initialize Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{initializeNsRappOptions}}
#'   	 
#' @inheritParams initializeNsRappOptions
#' @param path \code{\link{character}}.
#' @param ns \code{\link{character}}.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/initializeNsRappOptions.r
#' @seealso \code{
#'    \link[rapp]{initializeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "initializeNsRappOptions", 
  signature = signature(
    path = "character",
    ns = "character"
  ), 
  definition = function(
    path,
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
    id = file.path(ns, "github_name"),
    value = NA_character_
  )
  setRappOption(
    id = file.path(ns, "global_dir"),
    value = NA_character_
  )
  setRappOption(
    id = file.path(ns, "ns"),
    value = ns
  )
  setRappOption(
    id = file.path(ns, "is_internal"),
    value = TRUE
  )
 
  return(container)
    
  }
)
