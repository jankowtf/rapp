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
#' @example inst/examples/readRappOptionFile.r
#' @seealso \code{
#'   	\link[rapptime]{readRappOptionFile-character-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "readRappOptionFile",
  signature = c(
    "path"
  ),
  def = function(
    path = "options/options_runtime.r",
    strict = FALSE,
    ...
  ) {
    standardGeneric("readRappOptionFile")       
  }
)

#' @title
#' Read Runtime Options
#'
#' @description 
#' See generic: \code{\link[rapptime]{readRappOptionFile}}
#'   	 
#' @inheritParams readRappOptionFile
#' @param path \code{\link{missing}}. Default path.
#' @return See method
#'    \code{\link[rapptime]{readRappOptionFile-character-method}}
#' @example inst/examples/readRappOptionFile.r
#' @seealso \code{
#'    \link[rapptime]{readRappOptionFile}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "readRappOptionFile", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
  
  return(readRappOptionFile(
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
#' See generic: \code{\link[rapptime]{readRappOptionFile}}
#'      
#' @inheritParams readRappOptionFile
#' @param path \code{\link{character}}. Default path.
#' @return \code{\link{list}}. Options as name-value pairs.
#' @example inst/examples/readRappOptionFile.r
#' @seealso \code{
#'    \link[rapptime]{readRappOptionFile}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "readRappOptionFile", 
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
      rapptime::signalCondition(
        condition = "InvalidOptionFilePath",
        msg = c(
          "Invalid path to option file",
          Path = path
        ),
        ns = "rapptime",
        type = "error"
      )
    }
  } else {
    out <- eval(parse(file = path))
  }  
  
  return(out)
    
  }
)
