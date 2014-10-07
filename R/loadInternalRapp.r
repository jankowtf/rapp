#' @title
#' Load Internal R Application
#'
#' @description 
#' Loads an internal R application inside \code{/apps}.
#' 
#' @details
#' 
#' Implications:
#' \itemize{
#'    \item{Working directory is changed (old working directory location is
#'    stored in \code{.rte/wd_prime})
#'    }
#'    \item{\code{\link[devtools]{load_all}} is called}
#'    \item{\code{\link[rapp]{ensureRappRuntime}} is called}
#' }
#'   	
#' @param id \strong{Signature argument}.
#'    Object containing application ID information.
#' @template threedot
#' @example inst/examples/loadInternalRapp.r
#' @seealso \code{
#'   	\link[rapp]{loadInternalRapp-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import libr
setGeneric(
  name = "loadInternalRapp",
  signature = c(
    "id"
  ),
  def = function(
    id,
    ...
  ) {
    standardGeneric("loadInternalRapp")       
  }
)

#' @title
#' Load Internal R Application
#'
#' @description 
#' See generic: \code{\link[rapp]{loadInternalRapp}}
#'   	 
#' @inheritParams loadInternalRapp
#' @param id \code{\link{character}}.
#' @return \code{\link{TRUE}}.
#' @example inst/examples/loadInternalRapp.r
#' @seealso \code{
#'    \link[rapp]{loadInternalRapp}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "loadInternalRapp", 
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
  
  ## Change working directory
  if (getwd() != path_app) {
    wd_0 <- setwd(path_app)  
    setRappOption(id = ".rte/wd_prime", value = wd_0)
  }
#   getRappOption(id = ".rte/wd_prime")
    
  ## Ensure runtime //
  ensureRappRuntime(overwrite = FALSE)

  ## Load R application //
  devtools::load_all()
  
  return(TRUE)
  
  }
)

