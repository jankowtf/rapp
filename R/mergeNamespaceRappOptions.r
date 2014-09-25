#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' Merges initial namespace options as set by 
#' \code{\link[runtimr]{initializeNamespaceRappOptions}} with the ones
#' specified in option file \code{/options/options_rapp.r} and read via 
#' \code{\link[runtimr]{readRappOptionFile}}.
#' 
#' @details
#' In case a file \code{options.r} exists in \code{/options/},
#' then it is parsed and if \code{ns} is specified, the default values 
#' from the generic function are overwritten. Else the default values are used.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information.
#' @param ns \strong{Signature argument}.
#'    Object containing file path information for the option file.
#' @template threedot
#' @example inst/examples/mergeNamespaceRappOptions.r
#' @seealso \code{
#'   	\link[runtimr]{mergeNamespaceRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "mergeNamespaceRappOptions",
  signature = c(
    "ns",
    "path"
  ),
  def = function(
    ns = rapp.core.package::asPackage(x = ".")$package,
    path = "options/options_rapp.r",
    ...
  ) {
    standardGeneric("mergeNamespaceRappOptions")       
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[runtimr]{mergeNamespaceRappOptions}}
#' 
#' @details
#' In case a file \code{options.r} exists in \code{/options/},
#' then it is parsed and if \code{ns} is specified, the default values 
#' from the generic function are overwritten. Else the default values are used.
#'   	 
#' @inheritParams mergeNamespaceRappOptions
#' @param ns \code{\link{missing}}. Default namespace.
#' @param path \code{\link{missing}}. Default option file path.
#' @return See method 
#'    \code{\link{mergeNamespaceRappOptions-character-character-method}}.
#' @example inst/examples/mergeNamespaceRappOptions.r
#' @seealso \code{
#'    \link[runtimr]{mergeNamespaceRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNamespaceRappOptions", 
  signature = signature(
    ns = "missing",
    path = "missing"
  ), 
  definition = function(
    ns,
    path,
    ...
  ) {
    
  return(mergeNamespaceRappOptions(
    ns = ns,
    path = path,
    ...
  ))
    
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[runtimr]{mergeNamespaceRappOptions}}
#' 
#' @details
#' In case a file \code{options.r} exists in \code{/options/},
#' then it is parsed and if \code{ns} is specified, the default values 
#' from the generic function are overwritten. Else the default values are used.
#'      
#' @inheritParams mergeNamespaceRappOptions
#' @param ns \code{\link{character}}. Default namespace.
#' @param path \code{\link{missing}}. Default option file path.
#' @return See method 
#'    \code{\link{mergeNamespaceRappOptions-character-character-method}}.
#' @example inst/examples/mergeNamespaceRappOptions.r
#' @seealso \code{
#'    \link[runtimr]{mergeNamespaceRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNamespaceRappOptions", 
  signature = signature(
    ns = "character",
    path = "missing"
  ), 
  definition = function(
    ns,
    path,
    ...
  ) {
    
  return(mergeNamespaceRappOptions(
    ns = ns,
    path = path,
    ...
  ))
    
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[runtimr]{mergeNamespaceRappOptions}}
#' 
#' @details
#' In case a file \code{options.r} exists in \code{/options/},
#' then it is parsed and if \code{ns} is specified, the default values 
#' from the generic function are overwritten. Else the default values are used.
#'      
#' @inheritParams mergeNamespaceRappOptions
#' @param ns \code{\link{missing}}. Default namespace.
#' @param path \code{\link{character}}. Default option file path.
#' @return See method 
#'    \code{\link{mergeNamespaceRappOptions-character-character-method}}.
#' @example inst/examples/mergeNamespaceRappOptions.r
#' @seealso \code{
#'    \link[runtimr]{mergeNamespaceRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNamespaceRappOptions", 
  signature = signature(
    ns = "missing",
    path = "character"
  ), 
  definition = function(
    ns,
    path,
    ...
  ) {
    
  return(mergeNamespaceRappOptions(
    ns = ns,
    path = path,
    ...
  ))
    
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[runtimr]{mergeNamespaceRappOptions}}
#' 
#' @details
#' In case a file \code{options.r} exists in \code{/options/},
#' then it is parsed and if \code{ns} is specified, the default values 
#' from the generic function are overwritten. Else the default values are used.
#'      
#' @inheritParams mergeNamespaceRappOptions
#' @param ns \code{\link{character}}. Default namespace.
#' @param path \code{\link{character}}. Default option file path.
#' @return \code{\link{environment}}. The options container as stored in 
#'    \code{options(".rapp")}.
#' @example inst/examples/mergeNamespaceRappOptions.r
#' @seealso \code{
#'    \link[runtimr]{mergeNamespaceRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNamespaceRappOptions", 
  signature = signature(
    ns = "character",
    path = "character"
  ), 
  definition = function(
    ns,
    path,
    ...
  ) {
  
  ## Private function //
  .validateMergeConstellation <- function(name, value_1, value_2) {
    if (value_1 != value_2) {
      runtimr::signalCondition(
        condition = "InvalidOptionMergeConstellation",
        msg = c(
          "Invalid option value constellation",
          Option = name,
          "Argument value" = value_1,
          "Option file value" = value_2
        ),
        ns = "runtimr",
        type = "error"
      )
    }
    TRUE
  }
  
  ## Read option file //
  opts <- readRappOptionFile(path = path)
  
  ## Namespace match check //
  if (length(opts)) {
    opt <- "ns"
    if (opt %in% names(opts)) {
      value <- opts[[opt]]
      .validateMergeConstellation(name = "ns", value_1 = ns, value_2 = value)
    }
  }    
  
  ## Initial values //
  opts_0 <- as.list(getNamespaceRappOption(ns = ns))
  
  ## Overwrite initial option values //
  idx <- intersect(names(opts), names(opts_0))
  if (length(idx)) {
    sapply(idx, function(ii) {
      setNamespaceRappOption(
        ns = ns, 
        id = ii, 
        value = opts[[ii]]
      )
    })
  }
  
  ## Special options //
  ## Option 'ns_global': depends on 'global_dir'
  global_dir <- getGlobalDirectory(strict = TRUE)
  
  fun <- function() {
    file.path(getGlobalDirectory(strict = TRUE), "ns", 
        getNamespaceRappOption(id = "ns"))
  }
  class(fun) <- c("RappReactiveValue", class(fun))
    
#   dir.create(value, recursive = TRUE, showWarnings = FALSE)
  
  if (FALSE) {
    setNamespaceRappOption(
      ns = ns,
      id = "ns_global",
      value = fun,
      must_exist = TRUE,
      strict = TRUE,
      branch_gap = TRUE
    )
  
    getNamespaceRappOption(
      ns = ns,
      id = "ns_global"
    )
    setGlobalDirectory(value = "c:/temp")
    getNamespaceRappOption(
      ns = ns,
      id = "ns_global"
    )
  }

  return(TRUE)
    
  }
)
