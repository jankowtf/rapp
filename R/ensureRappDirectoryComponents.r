#' @title
#' Ensure Rapp Directory Components
#'
#' @description 
#' Ensures certain components of the \code{rapp} directory of a package project.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @param overwrite \code{\link{logical}}.
#'    \code{TRUE}: overwrite existing directory components;
#'    \code{FALSE}: do not overwrite existing directory components.
#' @template threedot
#' @example inst/examples/ensureRappDirectoryComponents.r
#' @seealso \code{
#'   	\link[rapp.core.rte]{ensureRappDirectoryComponents-missing-method}
#' }
#' @template author
#' @template references
setGeneric(
  name = "ensureRappDirectoryComponents",
  signature = c(
    "ns"
  ),
  def = function(
    ns,
    overwrite = FALSE,
    ...
  ) {
    standardGeneric("ensureRappDirectoryComponents")       
  }
)

#' @title
#' Ensure Initial Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp.core.rte]{ensureRappDirectoryComponents}}
#'   	 
#' @inheritParams ensureRappDirectoryComponents
#' @param ns \code{\link{missing}}. Default namespace.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/ensureRappDirectoryComponents.r
#' @seealso \code{
#'    \link[rapp.core.rte]{ensureRappDirectoryComponents}
#' }
#' @template author
#' @template references
#' @import rapp.core.package
setMethod(
  f = "ensureRappDirectoryComponents", 
  signature = signature(
    ns = "missing"
  ), 
  definition = function(
    ns,
    overwrite,
    ...
  ) {
    
  if (isPackageProject()) {
    ## Private function //
    
    dirs <- c(
      "rapp/.internal",
      "rapp/apps/test/options",
      "rapp/apps/test/R",
      "rapp/dev",
      "rapp/options"
    )
    sapply(dirs, dir.create, recursive = TRUE, showWarnings = FALSE)
    
    expr <- substitute(
      list(
        rapp_global = file.path(Sys.getenv("HOME"), "rapp"),
        runtime_mode = "dev",
        lib = .libPaths()[1]
      )
    )    
    fpaths <- c(
      "rapp/options/options_runtime.r",
      "rapp/apps/test/options/options_runtime.r"
    ) 
    if (overwrite) {
      idx <- seq(along = fpaths)
    } else {
      idx <- which(!sapply(fpaths, file.exists))
    }
    if (length(idx)) {
      sapply(fpaths[idx], function(ii) {
        write(
          rapp.core.rte::tidySource(input = expr, name = "options_runtime"), 
          file = ii
        )
      })
    }
    expr <- substitute(
      list(
        ns = rapp.core.package::asPackage(x = ".")$package,
        option_2 = "your option value here (can be any R object)",
        option_3 = "your option value here (can be any R object)"
      )
    ) 
    fpaths <- c(
      "rapp/options/options.r",
      "rapp/apps/test/options/options.r"
    ) 
    if (overwrite) {
      idx <- seq(along = fpaths)
    } else {
      idx <- which(!sapply(fpaths, file.exists))
    }
    if (length(idx)) {
      sapply(fpaths[idx], function(ii) {
        write(
          rapp.core.rte::tidySource(input = expr, name = "options"), 
          file = ii
        )
      })
    }
    
    out <- TRUE
  } else {
    out <- FALSE
  }
  
  return(out)
    
  }
)
