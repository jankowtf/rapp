#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' Ensures initial options as expected by the \code{rapp} framework and its 
#' associated packages. The options are stored as \code{".rapp"} in 
#' \code{\link[base]{options}}.
#'   	
#' @param ctx \strong{Signature argument}.
#'    Object containing context information.
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
    "ctx"
  ),
  def = function(
    ctx,
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
#' @param ctx \code{\link{missing}}. Default context.
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
    ctx = "missing"
  ), 
  definition = function(
    ctx,
    ...
  ) {
    
  container <- ensureRappOptionsContainer(overwrite = TRUE)
  
  setRappOption(
    id = ".rte/runtime_stage",
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
