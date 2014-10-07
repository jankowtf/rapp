#' @title
#' Initialize Namespace Options
#'
#' @description 
#' Generic interface for initializing namespace-specific options.
#' Projects and applications using \code{rapp} can implement this interface
#' by providing custom methods.
#' 
#' @section Compatible option files:
#' 
#' You are totally flexible with respect to where to put your option files
#' and what to put into them as long as they follow the structure of 
#' \emph{key-value} pairs in form of a \code{\link{list}}. 
#' See \code{\link[rapp]{readRappOptionFile}} or 
#' \code{\link[rapp]{mergeNsRappOptions}} for examples.
#'   	
#' @param ns \strong{Signature argument}.
#'    Object containing namespace information. Typically, this corresponds 
#'    to the instance of a class that denotes the project's or application's
#'    namespace (e.g. instance of class \code{MyTestApplication}).
#' @param option_file \strong{Signature argument}.
#'    Object containing option file location information. 
#'    Typically, this corresponds to a file path pointing to an option file 
#'    that is compatible with the \code{rapp} framework. See section
#'    \emph{Compatible option files}.
#' @param ensure_existence \code{\link{logical}}.
#'    \code{TRUE}: ensure existence of file system components;
#'    \code{FALSE}: only set options without ensuring existence of file system
#'    components. File system components such as directory and file paths
#'    need to be denoted as such either by 
#'    \code{\link[filesystr]{asDirctoryPath.S3}} or 
#'    \code{\link[filesystr]{asFilePath.S3}} in order for this to work
#' @template threedot
#' @example inst/examples/initializeNsOptions.r
#' @seealso \code{
#'   	\link[rapp]{initializeNsRappOptions}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "initializeNsOptions",
  signature = c(
    "ns",
    "option_file"
  ),
  def = function(
    ns,
    option_file,
    ensure_existence = FALSE,
    ...
  ) {
    standardGeneric("initializeNsOptions")       
  }
)

#' @title
#' Initialize Namespace Options
#'
#' @description 
#' See generic: \code{\link[rapp]{initializeNsOptions}}
#'      
#' @inheritParams initializeNsOptions
#' @param ns \code{\link{Namespace.S3}}.
#' @param option_file \code{\link{character}}.
#' @return TODO
#' @example inst/examples/initializeNsOptions.r
#' @seealso \code{
#'    \link[rapp]{initializeNsOptions}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "initializeNsOptions", 
  signature = signature(
    ns = "Namespace.S3",
    option_file = "character"
  ), 
  definition = function(
    ns,
    option_file,
    ensure_existence,
    ...
  ) {
    
#   ns <- rapp::Namespace.S3()
    
  ## Read option file //
  opts <- readRappOptionFile(path = option_file, strict = TRUE)
  idx_expr <- sapply(opts, is.expression)
  
  ## Default options //
  opts_int <- list(
    class_prefix_host = "RappScrapeHost_",
    class_prefix_query = "RappScrapeQuery_",
    class_prefix_request = "RappScrapeRequest_",
    ns = ns,
    #ns_instance=new("RappScrape"),
    ns_instance = rapp.scrape.registry::addClassAttribute(
      obj = ns, class_name = "RappScrapeRegistryS3"
    ),
    path_app = NA_character_
  )
  
  ## Overwrite internal settings //
  idx <- intersect(names(opts), names(opts_int))
  if (length(idx)) {
    for (ii in idx) {
      opts_int[[ii]] <- opts[[ii]]
      opts[[ii]] <- NULL
    }
  }
  opts <- c(opts, opts_int)

#   ## Set to namespace container //
#   out <- all(sapply(seq(along = opts), function(ii) {
#     setNsRappOption(
#       ns = ns,
#       id = names(opts)[ii],
#       value = opts[[ii]],
#       ...
#     )
#   }))
  ## Merge non-expression options //
  if (any(!idx_expr)) {
    idx_this <- names(opts)[!idx_expr]
  } else {
    idx_this <- names(opts)
  }
  out <- sapply(idx_this, function(ii) {
    setNsRappOption(
      ns = ns, 
      id = ii, 
      value = opts[[ii]]
    )
  })
  ## Process expression options //
  if (any(idx_expr)) {
    sapply(names(opts)[idx_expr], function(ii) {
      value <- opts[[ii]]
      if (is.expression(value)) {
        value <- eval(value)
      }
      setNsRappOption(
        ns = ns, 
        id = ii, 
        value = value
      )
    })  
  }
  
  if (ensure_existence) {
    idx <- which(names(opts) %in% c("dir_data", "dir_registry_backup"))
    if (length(idx)) {
      sapply(opts[idx], dir.create, recursive = TRUE, showWarnings = FALSE)
    }
#     idx <- which(names(opts) %in% c("path_registry"))
#     if (length(idx)) {
#       dir.create(dirname(opts[[idx]]), recursive = TRUE, showWarnings = FALSE)
# #       registry <- new.env()
# #       save(registry, file = dirname(opts[[idx]]))
#     }
  }

#   ## Re-initialize if app-context //
#   path_app <- getPackageOption(id = "path_app")
# path_app <- "rapp/apps/test"
#   if (!is.na(path_app) && file.exists(path_app)) {
#     initializePackageOptions(
#       ns = file.path(ns, basename(path_app)),
#       path = file.path(path_app, "options/options.r"),
#       ensure_existence = ensure_existence
#     )
#   }
  return(out)
    
  }
)

