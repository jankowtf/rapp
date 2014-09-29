#' @title
#' Create Package Skeleton
#' 
#' @description 
#' Creates an empty R package.
#' 
#' @param id \strong{Signature argument}.
#'    Object containing package ID information.
#' @param path \strong{Signature argument}.
#'    Object containing location information.
#' @param overwrite \code{\link{logical}}.
#'    \code{TRUE}: overwrite existing package project;
#'    \code{FALSE}: error if package project already exists.
#' @template threedot
#' @example inst/examples/createPackageSkeleton.r
#' @seealso \code{
#'   	\link[rapp]{createPackageSkeleton-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "createPackageSkeleton",
  signature = c(
    "id",
    "path"
  ),
  def = function(
    id,
    path,
    overwrite = FALSE,
    ...
  ) {
    standardGeneric("createPackageSkeleton")       
  }
)

#' @title
#' Create a New Application
#'
#' @description 
#' See generic: \code{\link[rapp]{createPackageSkeleton}}
#'      
#' @inheritParams createPackageSkeleton
#' @param id \code{\link{character}}. 
#' @param path \code{\link{character}}. 
#' @return \code{\link{character}}. Path to package directory. 
#' @example inst/examples/createPackageSkeleton.r
#' @seealso \code{
#'    \link[rapp]{createPackageSkeleton}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "createPackageSkeleton", 
  signature = signature(
    id = "character",
    path = "character"
  ), 
  definition = function(
    id,
    path,
    overwrite,
    ...
  ) {
  
  safe.dir.create <- function(path) {
    dirTest <- function(x) !is.na(isdir <- file.info(x)$isdir) & 
      isdir
    if (!dirTest(path) && !dir.create(path, showWarnings = FALSE)) 
      stop(gettextf("cannot create directory '%s'", path), 
           domain = NA)
  }
  
  curLocale <- Sys.getlocale("LC_CTYPE")
  on.exit(Sys.setlocale("LC_CTYPE", curLocale), add = TRUE)
  if (Sys.setlocale("LC_CTYPE", "C") != "C") 
    warning("cannot turn off locale-specific chars via LC_CTYPE", 
            domain = NA)
  
  dir <- file.path(path, id)
  if (file.exists(dir) && !overwrite) 
    stop(gettextf("directory '%s' already exists", dir), 
         domain = NA)
  safe.dir.create(dir)
  safe.dir.create(code_dir <- file.path(dir, "R"))
  safe.dir.create(docs_dir <- file.path(dir, "man"))
  safe.dir.create(data_dir <- file.path(dir, "data"))
  description <- file(file.path(dir, "DESCRIPTION"), "wt")
  cat("Package: ", id, "\n", "Type: Package\n", "Title: What the package does (short line)\n", 
      "Version: 1.0\n", "Date: ", format(Sys.time(), format = "%Y-%m-%d"), 
      "\n", "Author: Who wrote it\n", "Maintainer: Who to complain to <yourfault@somewhere.net>\n", 
      "Description: More about what it does (maybe more than one line)\n", 
      "License: What license is it under?\n", file = description, sep = "")
  close(description)
  out <- file(file.path(dir, "NAMESPACE"), "wt")
  writeLines("exportPattern(\"^[[:alpha:]]+\")", out)
  close(out)
  
  ## Package file //
  pkg_r <- c(
    "#' @title",
    "#' Package Title",
    "#'",
    "#' @description",
    "#' Package description",
    "#' ",
    "#' @details ",
    "#' The core functions/methods of this package: ",
    "#'  \\itemize{",
    sprintf("#'    \\item{\\code{\\link[%s]{function-name}}: }{", id),
    "#'",
    "#'      Description of this function.",
    "#'",
    "#'      Use empty lines for creating vertical space.",
    "#'    }",
    sprintf("#'    \\item{\\code{\\link[%s]{function-name}}: }{", id),
    "#'",
    "#'      Description of this function.",
    "#'",
    "#'      Use empty lines for creating vertical space.",
    "#'    }",
    "#' }",
    "#'",
    "#' @template author",
    "#' @template references",
    "#' @docType package",
    sprintf("#' @name %s", id),
    "NULL"
  )
  write(pkg_r, file = file.path(code_dir, paste0(id, ".r")))
  
  ## Help files //
  yy <- try(suppressMessages({
    promptPackage(id, filename = file.path(docs_dir, 
       sprintf("%s.Rd", id)), lib.loc = path)
  }))
  if (inherits(yy, "try-error")) 
    stop(yy)
  if (length(list.files(code_dir)) == 0L) 
    unlink(code_dir, recursive = TRUE)
#   if (length(list.files(data_dir)) == 0L) 
#     unlink(data_dir, recursive = TRUE)
  return(dir)

})
