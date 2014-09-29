#' @title
#' Check for Existence of Runtime Option File
#'
#' @description 
#' Checks if file \code{/options/options_runtime.r} exists.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: trigger error on negative check result; \code{FALSE}: return
#'    \code{FALSE} on negative check result.
#' @template threedot
#' @example inst/examples/hasRuntimeOptionFile.r
#' @seealso \code{
#'   	\link[rapp]{hasRuntimeOptionFile-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "hasRuntimeOptionFile",
  signature = c(
    "path"
  ),
  def = function(
    path = "options/options_runtime.r",
    strict = FALSE,
    ...
  ) {
    standardGeneric("hasRuntimeOptionFile")       
  }
)

#' @title
#' Is Package Project
#'
#' @description 
#' See generic: \code{\link[rapp]{hasRuntimeOptionFile}}
#'      
#' @inheritParams hasRuntimeOptionFile
#' @param path  \code{\link{missing}}. 
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/hasRuntimeOptionFile.r
#' @seealso \code{
#'    \link[rapp]{hasRuntimeOptionFile}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "hasRuntimeOptionFile", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
  
  return(hasRuntimeOptionFile(
    path = path,
    strict = strict,
    ...
  ))
  
  }
)

#' @title
#' Is Package Project
#'
#' @description 
#' See generic: \code{\link[rapp]{hasRuntimeOptionFile}}
#'      
#' @inheritParams hasRuntimeOptionFile
#' @param path  \code{\link{character}}. 
#' @return \code{\link{logical}}. \code{TRUE}: exists; \code{FALSE}: does not exist.
#' @example inst/examples/hasRuntimeOptionFile.r
#' @seealso \code{
#'    \link[rapp]{hasRuntimeOptionFile}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "hasRuntimeOptionFile", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
  
  ## Root directory exist check //
  if (!file.exists(path)) {
    if (!strict) {
      return(FALSE)
    } else {
      rapp::signalCondition(
        condition = "NegativeOptionFileCheck",
        msg = c(
          "Option file does not exist",
          Path = path
        ),
        ns = "rapp",
        type = "error"
      )
    }
  }    
  
  return(TRUE)
  
  }
)
