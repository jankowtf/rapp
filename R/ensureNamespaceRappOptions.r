#' @title
#' Ensure Rapp Options for Specific Namespace
#'
#' @description 
#' Ensures rapp options for a specific context. Usually this corresponds to 
#' a specific package project or application.
#' 
#' @details
#' In case a file \code{options.r} exists in \code{/rapp/options/},
#' then it is parsed and if \code{ns} is specified, the default values 
#' from the generic function are overwritten. Else the default values are used.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/ensureNamespaceRappOptions.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureNamespaceRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "ensureNamespaceRappOptions",
  signature = c(
    "ns"
  ),
  def = function(
    ns = rapp.core.package::asPackage(x = ".")$package,
    ...
  ) {
    standardGeneric("ensureNamespaceRappOptions")       
  }
)

#' @title
#' Ensure Rapp Options for Specific Context
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureNamespaceRappOptions}}
#' 
#' @details
#' In case a file \code{options.r} exists in \code{/rapp/options/},
#' then it is parsed and if \code{ns} is specified, the default values 
#' from the generic function are overwritten. Else the default values are used.
#'   	 
#' @inheritParams ensureNamespaceRappOptions
#' @param ns \code{\link{missing}}. Default context.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureNamespaceRappOptions.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureNamespaceRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureNamespaceRappOptions", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  ## Overwrite if option file exists //
  fpath <- "rapp/options/options.r"
  opts <- readRuntimeOptionFile(path = fpath)
  if (length(opts)) {
    if ("ns" %in% names(opts)) {
      ns <- opts$ns
    }
  }    
    
  return(ensureNamespaceRappOptions(
    ns = ns,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Options for Specific Context
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureNamespaceRappOptions}}
#'      
#' @inheritParams ensureNamespaceRappOptions
#' @param ns \code{\link{character}}.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureNamespaceRappOptions.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureNamespaceRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureNamespaceRappOptions", 
  signature = signature(
    ns = "character"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  out <- NULL    
  out <- c(out, setRappOption(
    id = ns,
    value = new.env()
  ))
  
  value <- file.path(getRappGlobal(strict = TRUE), "ns", ns)
  dir.create(value, recursive = TRUE, showWarnings = FALSE)
  
  out <- c(out, setRappOption(
    id = file.path(ns, "ns"),
    value = ns
  ))
  out <- c(out, setRappOption(
    id = file.path(ns, "ns_global"),
    value = value
  ))
  
  return(out)
    
  }
)
