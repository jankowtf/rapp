#' @title
#' Ensure Rapp Options Container
#'
#' @description 
#' Ensures the existence of an \code{environment} that serves as an options
#' container for the \code{rapp} framework and its associated packages.
#' The container will be assigned to option \code{".rapp"}.
#'   	
#' @param container \strong{Signature argument}.
#'    Object containing container information.
#' @param overwrite \code{\link{logical}}.
#'    \code{TRUE}: overwrite existing container; \code{FALSE}: keep existing 
#'    container.
#' @template threedot
#' @example inst/examples/ensureRappOptionsContainer.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureRappOptionsContainer-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "ensureRappOptionsContainer",
  signature = c(
    "container"
  ),
  def = function(
    container = new.env(),
    overwrite = FALSE,
    ...
  ) {
    standardGeneric("ensureRappOptionsContainer")       
  }
)

#' @title
#' Ensure Development Environment
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappOptionsContainer}}
#'   	 
#' @inheritParams ensureRappOptionsContainer
#' @param container \code{\link{missing}}. Default container.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/ensureRappOptionsContainer.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappOptionsContainer}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRappOptionsContainer", 
  signature = signature(
    container = "missing"
  ), 
  definition = function(
    container,
    overwrite,
    ...
  ) {
    
  opt_name <- ".rapp"    
  rapp_opts <- getOption(opt_name)
  if (is.null(rapp_opts) || overwrite) {
    options(".rapp" = container)
  }
  return(getOption(".rapp"))
  
  }
)
