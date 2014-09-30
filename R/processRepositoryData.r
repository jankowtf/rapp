#' @title
#' Process Repository Data
#'
#' @description 
#' Takes care of processing repository data as provided in the \code{rapp}
#' options.
#' 
#' @details
#' The main aspects that this method takes care of are ensuring that the 
#' valid repositories exist and that the information is carried over to the
#' R option \code{option("repos")}.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @template threedot
#' @example inst/examples/processRepositoryData.r
#' @seealso \code{
#'   	\link[rapp]{processRepositoryData-character-ANY-environment-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "processRepositoryData",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    ...
  ) {
    standardGeneric("processRepositoryData")       
  }
)

#' @title
#' Process Repository Data
#'
#' @description 
#' See generic: \code{\link[rapp]{processRepositoryData}}
#'      
#' @inheritParams processRepositoryData
#' @param ns  \code{\link{missing}}. 
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/processRepositoryData.r
#' @seealso \code{
#'    \link[rapp]{processRepositoryData}
#' }
#' @template author
#' @template references
#' @export
#' @import rapp.core.repos
setMethod(
  f = "processRepositoryData", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    ...
  ) {
  
  repos_list <- getOption("repos")    
  repos_list_names <- names(repos_list)
    
  ## Global //
  repos_global_list <- c(
    getRappOption(id = ".rte/repos_dev_global"),
    getRappOption(id = ".rte/repos_test_global"),
    getRappOption(id = ".rte/repos_live_global")
  )
  sapply(repos_global_list, 
     rapp.core.repos::ensureRepository
  )
  repos_pkg_list <- c(
    getRappOption(id = ".rte/repos_dev_pkg"),
    getRappOption(id = ".rte/repos_test_pkg"),
    getRappOption(id = ".rte/repos_live_pkg")
  )
  sapply(repos_pkg_list, 
     rapp.core.repos::ensureRepository
  )
  
  repos_list <- unique(c(
    repos_list, 
    getRappOption(id = ".rte/repos_global"),
    getRappOption(id = ".rte/repos_pkg")
  ))
  names(repos_list) <- unique(c(repos_list_names, "global_dir", "rapp_package"))
  
  on.exit(options("repos" = repos_list))
  return(TRUE)
  
  }
)
