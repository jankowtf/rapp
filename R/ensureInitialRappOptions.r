#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' Ensures initial options as expected by the \code{rapp} framework and its 
#' associated packages. The options are stored as \code{".rapp"} in 
#' \code{\link[base]{options}}.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/ensureInitialRappOptions.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureInitialRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "ensureInitialRappOptions",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("ensureInitialRappOptions")       
  }
)

#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureInitialRappOptions}}
#'   	 
#' @inheritParams ensureInitialRappOptions
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureInitialRappOptions.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureInitialRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureInitialRappOptions", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
    
  container <- ensureRappOptionsContainer(overwrite = TRUE)
  
  setRappOption(
    id = ".rte/runtime_mode",
    value = "dev",
    branch_gap = TRUE
  )
  setRappOption(
    id = ".rte/repos_root",
    value = NA_character_
  )
  setRappOption(
    id = ".rte/repos_global",
    value = NA_character_
  )
  setRappOption(
    id = ".rte/repos_pkgs",
    value = NA_character_
  )

  return(container)
    
  }
)
