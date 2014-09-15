#' @title
#' Ensure Rapp Options for Specific Context
#'
#' @description 
#' Ensures rapp options for a specific context. Usually this corresponds to 
#' a specific package project or application.
#'   	
#' @param ctx \strong{Signature argument}.
#'    Object containing context information.
#' @template threedot
#' @example inst/examples/ensureContextRappOptions.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureContextRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "ensureContextRappOptions",
  signature = c(
    "ctx"
  ),
  def = function(
    ctx = rapp.core.package::asPackage(x = ".")$package,
    ...
  ) {
    standardGeneric("ensureContextRappOptions")       
  }
)

#' @title
#' Ensure Rapp Options for Specific Context
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureContextRappOptions}}
#'   	 
#' @inheritParams ensureContextRappOptions
#' @param ctx \code{\link{missing}}. Default context.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureContextRappOptions.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureContextRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureContextRappOptions", 
  signature = signature(
    ctx = "missing"
  ), 
  definition = function(
    ctx,
    ...
  ) {
  
  return(ensureContextRappOptions(
    ctx = ctx,
    ...
  ))
    
  }
)

#' @title
#' Ensure Rapp Options for Specific Context
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureContextRappOptions}}
#'      
#' @inheritParams ensureContextRappOptions
#' @param ctx \code{\link{character}}. Default context.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureContextRappOptions.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureContextRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureContextRappOptions", 
  signature = signature(
    ctx = "character"
  ), 
  definition = function(
    ctx,
    ...
  ) {
  
  out <- NULL    
  out <- c(out, setRappOption(
    id = ctx,
    value = new.env()
  ))
  
  value <- file.path(getRappHome(strict = TRUE), "contexts", ctx)
  dir.create(value, recursive = TRUE, showWarnings = FALSE)
  
  out <- c(out, setRappOption(
    id = file.path(ctx, "context_home"),
    value = value
  ))
  
  return(out)
    
  }
)
