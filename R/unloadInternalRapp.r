#' @title
#' Unload Internal R Application
#'
#' @description 
#' Unloads an internal R application inside \code{/apps}.
#' 
#' @details
#' 
#' Implications:
#' \itemize{
#'    \item{\code{\link[devtools]{unload}} is called}
#'    \item{Working directory is changed back to that stored in option
#'    \code{.rte/wd_prime})
#'    }
#'    \item{Subcontainer for application is removed}
#'    \item{\code{\link[rapp]{ensureRappRuntime}} is called}
#' }
#'   	
#' @param id \strong{Signature argument}.
#'    Object containing application ID information.
#' @template threedot
#' @example inst/examples/unloadInternalRapp.r
#' @seealso \code{
#'   	\link[rapp]{unloadInternalRapp-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import libr
setGeneric(
  name = "unloadInternalRapp",
  signature = c(
    "id"
  ),
  def = function(
    id,
    ...
  ) {
    standardGeneric("unloadInternalRapp")       
  }
)

#' @title
#' Unload Internal R Application
#'
#' @description 
#' See generic: \code{\link[rapp]{unloadInternalRapp}}
#'   	 
#' @inheritParams unloadInternalRapp
#' @param id \code{\link{character}}.
#' @return \code{\link{TRUE}}.
#' @example inst/examples/unloadInternalRapp.r
#' @seealso \code{
#'    \link[rapp]{unloadInternalRapp}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "unloadInternalRapp", 
  signature = signature(
    id = "character"
  ), 
  definition = function(
    id,
    ...
  ) {
  
  ## Unload R application //
  devtools::unload()
  
  ## Change working directory
  setwd(getRappOption(id = ".rte/wd_prime"))  
    
  ## Remove subcontainer //
  rapp_opts <- getRappOptions(strict = TRUE)
  if (exists(id, rapp_opts, inherits = FALSE)) {
    rm(list = id, envir = rapp_opts, inherits = FALSE)
  }
  
  ## Ensure runtime //
  ensureRappRuntime(overwrite = FALSE)
  
  return(TRUE)
  
  }
)

