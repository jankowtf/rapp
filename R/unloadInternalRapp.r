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
  
  path_parent <- "apps"
  if (!file.exists(path_parent)) {
    rapp::signalCondition(
      condition = "InvalidProjectStructure",
      msg = c(
        "Invalid project structure",
        Reason = "expecting 'apps' directory but not found",
        "Working directory" = getwd()
      ),
      ns = "rapp",
      type = "error"
    )
  }
  path_app <- file.path(path_parent, id)
  if (!file.exists(path_app)) {
    rapp::signalCondition(
      condition = "InvalidInternalApplicationID",
      msg = c(
        "Invalid internal application ID",
        Reason = paste0("expecting app '", id, "' below 'apps' but not found"),
        "Working directory" = getwd()
      ),
      ns = "rapp",
      type = "error"
    )
  }
  
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

