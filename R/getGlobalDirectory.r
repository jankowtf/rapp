#' @title
#' Get Global Directory
#'
#' @description 
#' Retrieves the option that corresponds to the path of the global directory 
#' associated to the \code{rapp} framework and its associated packages and
#' applications.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/getGlobalDirectory.r
#' @seealso \code{
#'   	\link[runtimr]{getGlobalDirectory-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "getGlobalDirectory",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("getGlobalDirectory")       
  }
)

#' @title
#' Get Global Directory
#'
#' @description 
#' See generic: \code{\link[runtimr]{getGlobalDirectory}}
#'      
#' @inheritParams getGlobalDirectory
#' @param ns \code{\link{missing}}. Default ns.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/getGlobalDirectory.r
#' @seealso \code{
#'    \link[runtimr]{getGlobalDirectory}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getGlobalDirectory", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  return(getRappOption(id = ".rte/global_dir", ...))
    
  }
)
