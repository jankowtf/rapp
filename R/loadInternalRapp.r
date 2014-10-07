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
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: trigger error when function is run from an inapproproate
#'    environment in the sense that it is not a package project containing 
#'    internal apps in directory \code{/apps/};
#'    \code{FALSE}: tries to fix working directory so the internal app can 
#'    be loaded (typically usefull if running the function twice in a row or 
#'    something like that). 
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
    strict = FALSE,
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
    strict,
    ...
  ) {
  
  path_parent <- "apps"
  if (!file.exists(path_parent)) {
    if (!strict) {
    ## Try to restore working directory 
      setwd(getRappOption(".rte/wd_prime"))
      loadInternalRapp(id = id, strict = TRUE)
      return(TRUE)
    } else {
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
  }
  path_app <- file.path(path_parent, id)
  if (!file.exists(path_app)) {
    if (!strict) {
    ## Try to restore working directory 
      setwd(getRappOption(".rte/wd_prime"))
      loadInternalRapp(id = id, strict = TRUE)
      return(TRUE)
    } else {
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
  }
  
  ## Ensure runtime //
  if (!isRappRuntime()) {
    ensureRappRuntime()
  }
  
  ## Change working directory
  if (getwd() != path_app) {
    wd_0 <- setwd(path_app)  
    setRappOption(id = ".rte/wd_prime", value = wd_0, strict = TRUE)
  }
#   getRappOption(id = ".rte/wd_prime")
    
  ## Ensure runtime //
  ensureRappRuntime(overwrite = FALSE)

  ## Load R application //
  devtools::load_all()
  
  return(TRUE)
  
  }
)

