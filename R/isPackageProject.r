#' @title
#' Is Package Project
#'
#' @description 
#' Checks if a given directory corresponds to an R package project following 
#' the conventions as specified in the R manual \emph{Writing R Extensions}
#' (\url{http://cran.r-project.org/doc/manuals/r-release/R-exts.html#Package-structure})
#'   	
#' @details
#' The check is performed based on looking up the following project components 
#' as these seem to be the minimal requirements that must be met:
#' \itemize{
#'    \item{\code{DESCRIPTION} file}
#'    \item{\code{man} directory}
#'    \item{\code{NAMESPACE} file}
#'    \item{\code{R} directory}
#' }   
#' In addition, the content of \code{DESCRIPTION} is read via 
#' \code{\link[base]{read.dcf}}.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: trigger error on negative check result; \code{FALSE}: return
#'    \cod{FALSE} on negative check result.
#' @template threedot
#' @example inst/examples/isPackageProject.r
#' @seealso \code{
#'   	\link[runtimr]{isPackageProject-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "isPackageProject",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    strict = FALSE,
    ...
  ) {
    standardGeneric("isPackageProject")       
  }
)

#' @title
#' Is Package Project
#'
#' @description 
#' See generic: \code{\link[runtimr]{isPackageProject}}
#'      
#' @inheritParams isPackageProject
#' @param path  \code{\link{missing}}. 
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/isPackageProject.r
#' @seealso \code{
#'    \link[runtimr]{isPackageProject}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isPackageProject", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
  
  return(isPackageProject(
    path = path,
    strict = strict,
    ...
  ))
  
  }
)

#' @title
#' Is Package Project
#'
#' @description 
#' See generic: \code{\link[runtimr]{isPackageProject}}
#'      
#' @inheritParams isPackageProject
#' @param path  \code{\link{character}}. 
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/isPackageProject.r
#' @seealso \code{
#'    \link[runtimr]{isPackageProject}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isPackageProject", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    strict,
    ...
  ) {
  
  ## Root directory exist check //
  if (!file.exists(path)) {
    if (!strict) {
      return(FALSE)
    } else {
      runtimr::signalCondition(
        condition = c("NegativePackageProjectCheck",
                      "InvalidDirectoryPath"),
        msg = c(
          "Package project check was negative",
          Details = "directory does not exist",
          Path = path
        ),
        ns = "runtimr",
        type = "error"
      )
    }
  }    
  
  ## Root directory type check //
  if (!file.info(path)$isdir) {
    if (!strict) {
      return(FALSE)
    } else {
      runtimr::signalCondition(
        condition = c("NegativePackageProjectCheck",
                      "NotADirectory"),
        msg = c(
          "Package project check was negative",
          Details = "not a directory",
          Path = path
        ),
        ns = "runtimr",
        type = "error"
      )
    }
  }    
    
  ## Patterns/info to look for //    
  pattern_dirs <- c(
    "man",
    "R"
  )    
  pattern_files <- c(
    "DESCRIPTION",
    "NAMESPACE"
  )
  pattern_desc <- c(
    "Package",
    "Title",
    "Description",
    "Version",
    "Author",
    "License"
  )
  
  files <- list.files(path, full.names = TRUE)
  finfo <- file.info(files)
  bnames <- basename(files)
  
  ## Existence check //
  idx <- c(pattern_dirs, pattern_files) %in% bnames
  if (!all(idx)) {
    if (!strict) {
      return(FALSE)
    } else {
      runtimr::signalCondition(
        condition = c("NegativePackageProjectCheck",
                      "MissingPackageComponents"),
        msg = c(
          "Package project check was negative",
          Details = "missing package components",
          Path = path
        ),
        ns = "runtimr",
        type = "error"
      )
    }
  }
  
  ## Ressource type check //
  idx_dirs <- which(bnames %in% pattern_dirs)
  idx_files <- which(bnames %in% pattern_files)
  
  idx_dirs <- finfo[idx_dirs,]$isdir
  names(idx_dirs) <- pattern_dirs
  idx_files <- !finfo[idx_files,]$isdir
  names(idx_files) <- pattern_files
  
  if (!all(c(idx_dirs, idx_files))) {
    if (!strict) {
      return(FALSE)
    } else {
      runtimr::signalCondition(
        condition = c("NegativePackageProjectCheck",
                      "InvalidRessourceTypes"),
        msg = c(
          "Package project check was negative",
          Details = "invalid ressource types",
          Path = path,
          "Missing directories" = names(idx_dirs)[!idx_dirs],
          "Missing files" = names(idx_files)[!idx_files]
        ),
        ns = "runtimr",
        type = "error"
      )
    }
  }
  
  ## DESCRIPTION content check //
  desc_error <- FALSE
  cnt <- read.dcf(files[which(bnames == "DESCRIPTION")])
  if (!length(cnt)) {
    desc_error <- TRUE
  }
  idx <- pattern_desc %in% colnames(cnt)
  if (!all(idx)) {
    desc_error <- TRUE
  }
  if (desc_error) {
    if (!strict) {
      return(FALSE)
    } else {
      runtimr::signalCondition(
        condition = c("NegativePackageProjectCheck",
                      "InvalidDescriptionFileContent"),
        msg = c(
          "Package project check was negative",
          Details = "invalid DESCRIPTION file content",
          Path = path
        ),
        ns = "runtimr",
        type = "error"
      )
    }
  }
  
  return(TRUE)
  
  }
)
