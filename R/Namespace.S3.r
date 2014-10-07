#' @title
#' Class: Namespace.S3 
#'
#' @description
#' Class representing the system state (S3) and its constructor function.
#' 
#' @template intended-use
#'
#' @param .x \code{\link{ANY}}. An object of an arbitrary class whose class
#'    attribute should be updated so that it becomes an instance of class
#'    \code{Namespace.S3}. Mainly intended for rapid prototyping 
#'    purposes
#'    
#' @field ns \code{\link{character}}.
#'    Namespace name.
#'    Default: \code{"rapp"}.
#' @return Instance of class \code{Namespace.S3}.
#' @example inst/examples/Namespace.S3.r
#' @seealso \code{
#'   	\link[bumpr]{GitVersion.S3}
#'     \link[bumpr]{RPackageVersion.S3}
#' }
#' @template author
#' @template references
#' @export
Namespace.S3 <- function(
  .x,
  ns = "rapp"
) {
  if (!missing(.x)) {
    class(.x) <- c("Namespace.S3", class(.x))
    out <- .x
  } else {
    out <- new.env()
    out$ns <- ns
    class(out) <- c("Namespace.S3", class(out))
  }
  return(out)
}
