#' @title
#' Ensure Project Components
#'
#' @description 
#' Ensures certain project components as either required or recommended
#' in the context of R package development using \code{\link{devtools}} and the
#' \code{rapp} framework and its associated packages.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @param overwrite \code{\link{logical}}.
#'    \code{TRUE}: overwrite existing directory components;
#'    \code{FALSE}: do not overwrite existing directory components.
#' @template threedot
#' @example inst/examples/ensureProjectComponents.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureProjectComponents-missing-method}
#' }
#' @template author
#' @template references
setGeneric(
  name = "ensureProjectComponents",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    overwrite = FALSE,
    ...
  ) {
    standardGeneric("ensureProjectComponents")       
  }
)

#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureProjectComponents}}
#'   	 
#' @inheritParams ensureProjectComponents
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureProjectComponents.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureProjectComponents}
#' }
#' @template author
#' @template references
setMethod(
  f = "ensureProjectComponents", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    overwrite,
    ...
  ) {
    
  if (isPackageProject()) {
    ## Ensure subdirectories //
    base::dir.create("data", showWarnings = FALSE)
    rapp.core.examples::ensureExamplesDirectory()
    base::dir.create("man-roxygen", showWarnings = FALSE)
    ## TODO 2014-09-16: create dummy roxygen templates as well
    ensureRappDirectoryComponents(overwrite = overwrite)
    base::dir.create("tests/testthat/data", recursive = TRUE, showWarnings = FALSE)
    ## TODO 2014-09-16: check what other components might make sense (dummy test files)
    ## TODO 2014-09-16: develop 'rapp.core.test' for ensuring unit tests
    base::dir.create("vignettes", recursive = TRUE, showWarnings = FALSE)
    out <- TRUE
  } else {
    out <- FALSE
  }
  
  return(out)
    
  }
)
