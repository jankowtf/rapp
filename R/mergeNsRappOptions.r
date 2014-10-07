#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' Merges initial namespace options as set by 
#' \code{\link[rapp]{initializeNsRappOptions}} with the ones
#' specified in option file \code{/options/options_ns.r} and read via 
#' \code{\link[rapp]{readRappOptionFile}}.
#'   	
#' @param path \strong{Signature argument}.
#'    Object containing location information. Typically, this corresponds to 
#'    the directory path of an R package project or R application project.
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information. Typically, this corresponds to 
#'    the the package name or application name.
#' @param option_file \strong{Signature argument}.
#'    Object containing file path information for the option file.
#' @template threedot
#' @example inst/examples/mergeNsRappOptions.r
#' @seealso \code{
#'   	\link[rapp]{mergeNsRappOptions-missing-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import libr
setGeneric(
  name = "mergeNsRappOptions",
  signature = c(
    "path",
    "ns",
    "option_file"
  ),
  def = function(
    path = ".",
    ns = if (isPackageProject(path)) {
      devtools::as.package(x = path)$package
    } else {
      libr::asPackage(x = path)$package
    },
    option_file = file.path(path, "options/options_ns.r"),
    ...
  ) {
    standardGeneric("mergeNsRappOptions")       
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{mergeNsRappOptions}}
#'   	 
#' @inheritParams mergeNsRappOptions
#' @param path \code{\link{missing}}. Current working directory.
#' @param ns \code{\link{missing}}. Default namespace.
#' @param option_file \code{\link{missing}}. Default option file path.
#' @return See method 
#'    \code{\link{mergeNsRappOptions-character-character-character-method}}.
#' @example inst/examples/mergeNsRappOptions.r
#' @seealso \code{
#'    \link[rapp]{mergeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNsRappOptions", 
  signature = signature(
    path = "missing",
    ns = "missing",
    option_file = "missing"
  ), 
  definition = function(
    path,
    ns,
    option_file,
    ...
  ) {
    
  return(mergeNsRappOptions(
    path = path,
    ns = ns,
    option_file = option_file,
    ...
  ))
    
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{mergeNsRappOptions}}
#'      
#' @inheritParams mergeNsRappOptions
#' @param path \code{\link{character}}. 
#' @param ns \code{\link{character}}. 
#' @param option_file \code{\link{missing}}. 
#' @return See method 
#'    \code{\link{mergeNsRappOptions-character-character-method}}.
#' @example inst/examples/mergeNsRappOptions.r
#' @seealso \code{
#'    \link[rapp]{mergeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNsRappOptions", 
  signature = signature(
    path = "character",
    ns = "character",
    option_file = "missing"
  ), 
  definition = function(
    path,
    ns,
    option_file,
    ...
  ) {
    
  return(mergeNsRappOptions(
    path = path,
    ns = ns,
    option_file = option_file,
    ...
  ))
    
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{mergeNsRappOptions}}
#' 
#' @details
#' In case a file \code{options.r} exists in \code{/options/},
#' then it is parsed and if \code{ns} is specified, the default values 
#' from the generic function are overwritten. Else the default values are used.
#'      
#' @inheritParams mergeNsRappOptions
#' @param path \code{\link{missing}}. 
#' @param ns \code{\link{missing}}. 
#' @param option_file \code{\link{character}}. 
#' @return See method 
#'    \code{\link{mergeNsRappOptions-character-character-method}}.
#' @example inst/examples/mergeNsRappOptions.r
#' @seealso \code{
#'    \link[rapp]{mergeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNsRappOptions", 
  signature = signature(
    path = "missing",
    ns = "missing",
    option_file = "character"
  ), 
  definition = function(
    path,
    ns,
    option_file,
    ...
  ) {
    
  return(mergeNsRappOptions(
    path = path,
    ns = ns,
    option_file = option_file,
    ...
  ))
    
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{mergeNsRappOptions}}
#' 
#' @inheritParams mergeNsRappOptions
#' @param path \code{\link{character}}. 
#' @param ns \code{\link{missing}}. 
#' @param option_file \code{\link{missing}}. 
#' @return See method 
#'    \code{\link{mergeNsRappOptions-character-character-method}}.
#' @example inst/examples/mergeNsRappOptions.r
#' @seealso \code{
#'    \link[rapp]{mergeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNsRappOptions", 
  signature = signature(
    path = "character",
    ns = "missing",
    option_file = "missing"
  ), 
  definition = function(
    path,
    ns,
    option_file,
    ...
  ) {
    
  return(mergeNsRappOptions(
    path = path,
    ns = ns,
    option_file = option_file,
    ...
  ))
    
  }
)

#' @title
#' Merge Namespace Rapp Options
#'
#' @description 
#' See generic: \code{\link[rapp]{mergeNsRappOptions}}
#'      
#' @inheritParams mergeNsRappOptions
#' @param path \code{\link{character}}.
#' @param ns \code{\link{character}}.
#' @param option_file \code{\link{character}}.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/mergeNsRappOptions.r
#' @seealso \code{
#'    \link[rapp]{mergeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "mergeNsRappOptions", 
  signature = signature(
    path = "character",
    ns = "character",
    option_file = "character"
  ), 
  definition = function(
    path,
    ns,
    option_file,
    ...
  ) {
  
  ## Private function //
  .validateMergeConstellation <- function(name, value_1, value_2) {
    if (value_1 != value_2) {
      rapp::signalCondition(
        condition = "InvalidOptionMergeConstellation",
        msg = c(
          "Invalid option value constellation",
          Option = name,
          "Argument value" = value_1,
          "Option file value" = value_2
        ),
        ns = "rapp",
        type = "error"
      )
    }
    TRUE
  }
  
  ## Read option file //
  opts <- readRappOptionFile(path = option_file)
  
  ## Namespace match check //
  if (length(opts)) {
    opt <- "ns"
    if (opt %in% names(opts)) {
      value <- opts[[opt]]
      .validateMergeConstellation(name = "ns", value_1 = ns, value_2 = value)
    }
  }    
  
  ## Initial values //
  opts_0 <- as.list(getNsRappOption(ns = ns))
  
#   ## Overwrite initial option values //
#   idx <- intersect(names(opts), names(opts_0))
#   if (length(idx)) {
#     sapply(idx, function(ii) {
#       setNsRappOption(
#         ns = ns, 
#         id = ii, 
#         value = opts[[ii]]
#       )
#     })
#   }
  
  ## Merge options //
  sapply(names(opts), function(ii) {
    setNsRappOption(
      ns = ns, 
      id = ii, 
      value = opts[[ii]]
    )
  })
  
  ## Ensure namespace-specific subdirectory //
  global_dir <- getNsRappOption(ns = ns, id = "global_dir")
  if (!is.null(global_dir) && !is.na(global_dir)) {
    ensureGlobalDirectory(path = global_dir)
  }
  
  ## Special options //
  ## Option 'global_dir': depends on 'global_dir'
#   global_dir <- getGlobalDirectory(strict = TRUE)
#   getNsRappOption(ns = ns, id = "global_dir")
  ## TODO: make reactive
  
  if (FALSE) {
    setNsRappOption(
      ns = ns,
      id = "global_dir",
      value = fun,
      must_exist = TRUE,
      strict = TRUE,
      branch_gap = TRUE
    )
  
    getNsRappOption(
      ns = ns,
      id = "global_dir"
    )
    setGlobalDirectory(value = "c:/temp")
    getNsRappOption(
      ns = ns,
      id = "global_dir"
    )
  }

  return(TRUE)
    
  }
)
