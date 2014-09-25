#' @title
#' Is Rapp Option Set
#'
#' @description 
#' Checks if a specific \code{rapp} option is set. 
#' See \code{\link{getRappOption}}.
#' 
#' @details
#' \code{NA} values (and all associated \code{NA} types, e.g. 
#' \code{NA_character_}) or empty values (e.g. \code{character()}) are regarded
#' as options that are not set.
#' Only options that already exist can be queried with this method. Trying to 
#' check a non-existing option results in an error.
#'   	
#' @param id \strong{Signature argument}.
#'    Object containing option path information.
#' @template threedot
#' @example inst/examples/isRappOptionSet.r
#' @seealso \code{
#'   	\link[runtimr]{isRappOptionSet-character-method},
#'    \link[runtimr]{getRappOption},
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "isRappOptionSet",
  signature = c(
    "id"
  ),
  def = function(
    id,
    ...
  ) {
    standardGeneric("isRappOptionSet")       
  }
)

#' @title
#' Is Rapp Option Set
#'
#' @description 
#' See generic: \code{\link[runtimr]{isRappOptionSet}}
#'   	 
#' @inheritParams isRappOptionSet
#' @param id \code{\link{character}}. Default id.
#' @return \code{\link{logical}}. \code{TRUE}: option is set; \code{FALSE}:
#'    option is not set.
#' @example inst/examples/isRappOptionSet.r
#' @seealso \code{
#'    \link[runtimr]{isRappOptionSet}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isRappOptionSet", 
  signature = signature(
    id = "character"
  ), 
  definition = function(
    id,
    ...
  ) {
  
  value <- getRappOption(id = id, strict = TRUE)
  if (is.na(value) || !length(value)) {
    out <- FALSE
  } else {
    out <- TRUE
  }
  
  return(out)
    
  }
)
