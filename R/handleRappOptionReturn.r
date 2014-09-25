#' @title
#' Handle Rapp Option Return Value
#'
#' @description 
#' Handles actual return value for rapp options.
#'   	
#' @param value \strong{Signature argument}.
#'    Object containing value information.
#' @template threedot
#' @example inst/examples/handleRappOptionReturn.r
#' @seealso \code{
#'   	\link[runtimr]{handleRappOptionReturn-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "handleRappOptionReturn",
  signature = c(
    "value"
  ),
  def = function(
    value,
    ...
  ) {
    standardGeneric("handleRappOptionReturn")       
  }
)

#' @title
#' Handle Rapp Option Return Value
#'
#' @description 
#' See generic: \code{\link[runtimr]{handleRappOptionReturn}}
#'      
#' @inheritParams handleRappOptionReturn
#' @param value \code{\link{ANY}}.
#' @return \code{\link{ANY}}. Option value or for non-existing option 
#'    (i.e. wrong \code{value}): \code{NULL} if \code{strict = FALSE} and an error
#'    if \code{strict = TRUE}.
#' @example inst/examples/handleRappOptionReturn.r
#' @seealso \code{
#'    \link[runtimr]{handleRappOptionReturn}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "handleRappOptionReturn", 
  signature = signature(
    value = "ANY"
  ), 
  definition = function(
    value,
    ...
  ) {

  return(value)
    
  }
)

#' @title
#' Handle Rapp Option Return Value
#'
#' @description 
#' See generic: \code{\link[runtimr]{handleRappOptionReturn}}
#'   	 
#' @inheritParams handleRappOptionReturn
#' @param value \code{\link{RappReactiveValue}}.
#' @return \code{\link{ANY}}. Option value or for non-existing option 
#'    (i.e. wrong \code{value}): \code{NULL} if \code{strict = FALSE} and an error
#'    if \code{strict = TRUE}.
#' @example inst/examples/handleRappOptionReturn.r
#' @seealso \code{
#'    \link[runtimr]{handleRappOptionReturn}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "handleRappOptionReturn", 
  signature = signature(
    value = "RappReactiveValue"
  ), 
  definition = function(
    value,
    ...
  ) {

  return(value())
    
  }
)
