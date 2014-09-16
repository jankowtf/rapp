#' @title
#' Read Runtime Options
#'
#' @description 
#' Reads runtime options from a respective option file.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: error if file does not exist;
#'    \code{FALSE}: empty list if file does not exist.
#' @template threedot
#' @example inst/examples/readRuntimeOptionFile.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{readRuntimeOptionFile-character-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "readRuntimeOptionFile",
  signature = c(
    "path"
  ),
  def = function(
    path = "rapp/options/options_runtime.r",
    strict = FALSE,
    ...
  ) {
    standardGeneric("readRuntimeOptionFile")       
  }
)

#' @title
#' Read Runtime Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{readRuntimeOptionFile}}
#'   	 
#' @inheritParams readRuntimeOptionFile
#' @param path \code{\link{missing}}. Default path.
#' @return See method
#'    \code{\link[rapp.core.rte]{readRuntimeOptionFile-character-method}}
#' @example inst/examples/readRuntimeOptionFile.r
#' @seealso \code{
#'    \link[rapp.core.rte]{readRuntimeOptionFile}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "readRuntimeOptionFile", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
  
  return(readRuntimeOptionFile(
    path = path,
    strict = strict,
    ...
  ))
    
  }
)

#' @title
#' Read Runtime Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{readRuntimeOptionFile}}
#'      
#' @inheritParams readRuntimeOptionFile
#' @param path \code{\link{character}}. Default path.
#' @return \code{\link{list}}. Options as name-value pairs.
#' @example inst/examples/readRuntimeOptionFile.r
#' @seealso \code{
#'    \link[rapp.core.rte]{readRuntimeOptionFile}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "readRuntimeOptionFile", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    strict, 
    ...
  ) {
  
  ## Overwrite if option file exists //
  if (!file.exists(path)) {
    if (!strict) {
      out <- list()
    } else {
      rapp.core.rte::signalCondition(
        condition = "InvalidOptionFilePath",
        msg = c(
          "Invalid path to option file",
          Path = path
        ),
        ns = "rapp.core.rte",
        type = "error"
      )
    }
  } else {
    out <- eval(parse(file = path))
  }  
  
  return(out)
    
  }
)
