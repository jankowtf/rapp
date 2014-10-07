#' @title
#' Get Rapp Options
#'
#' @description 
#' Retrieves the container stored at \code{options(".rapp")}.
#'   	
#' @param x \strong{Signature argument}.
#'    Object containing ID information.
#' @param strict \code{\link{logical}}. 
#'    \code{TRUE}: error is triggered if container does not exist;
#'    \code{FALSE}: returns with \code{NULL} in case container does not exist.
#' @template threedot
#' @example inst/examples/getRappOptions.r
#' @seealso \code{
#'   	\link[rapp]{getRappOptions-character-method},
#'     \link[rapp]{getRappOption}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "getRappOptions",
  signature = c(
    "id"
  ),
  def = function(
    id = ".rapp",
    strict = FALSE, 
    ...
  ) {
    standardGeneric("getRappOptions")       
  }
)

#' @title
#' Get Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{getRappOptions}}
#'      
#' @inheritParams getRappOptions
#' @param id \code{\link{missing}}.
#' @return \code{\link{environment}} or \code{NULL}.
#' @example inst/examples/getRappOptions.r
#' @seealso \code{
#'    \link[rapp]{getRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getRappOptions", 
  signature = signature(
    id = "missing"
  ), 
  definition = function(
    id,
    strict,
    ...
  ) {
    
  return(getRappOptions(
    id = id,
    strict = strict,
    ...
  ))    
    
  }
)

#' @title
#' Get Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{getRappOptions}}
#'   	 
#' @inheritParams getRappOptions
#' @param id \code{\link{character}}.
#' @return \code{\link{environment}} or \code{NULL}.
#' @example inst/examples/getRappOptions.r
#' @seealso \code{
#'    \link[rapp]{getRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getRappOptions", 
  signature = signature(
    id = "character"
  ), 
  definition = function(
    id,
    strict,
    ...
  ) {

  if (!length(id)) {
    if (!strict) {
      out <- NULL
    } else {
      rapp::signalCondition(
        condition = "InvalidIdForOptionsContainer",
        msg = c(
          Reason = "empty ID"
        ),
        ns = "rapp",
        type = "error"
      )
    }
  } else {
    out <- getOption(id)
    if (is.null(out) && strict) {
      rapp::signalCondition(
        condition = "InvalidIdForOptionsContainer",
        msg = c(
          Reason = "invalid ID",
          ID = id
        ),
        ns = "rapp",
        type = "error"
      )  
    }
  }
  
  return(out)
    
  }
)
