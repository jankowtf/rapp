#' @title
#' Is R Application
#'
#' @description 
#' Checks if a given directory corresponds to an R application
#' following  the conventions of the \code{rappr} framework
#'   	
#' @details
#' The check is performed based on the following aspects:
#' \itemize{
#'    \item{\code{batch} directory}
#'    \item{\code{DESCRIPTION} file}
#'    \item{\code{man} directory}
#'    \item{\code{NAMESPACE} file}
#'    \item{\code{options} directory}
#'    \item{\code{packrat} directory}
#'    \item{\code{R} directory}
#'    \item{\code{shiny} directory}
#'    \item{\code{.rapp} file}
#' }   
#' In addition, the content of \code{DESCRIPTION} is read via 
#' \code{\link[base]{read.dcf}}.
#' 
#' @param path \strong{Signature argument}.
#'    Object containing path information.
#' @param packrat \code{\link{logical}}.
#'    \code{TRUE}: look for \code{packrat} directory;
#'    \code{FALSE}: disregard existence of \code{packrat} directory.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: trigger error on negative check result; \code{FALSE}: return
#'    \code{FALSE} on negative check result.
#' @template threedot
#' @example inst/examples/isRapp.r
#' @seealso \code{
#'   	\link[rapp]{isRapp-character-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "isRapp",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    packrat = FALSE,
    strict = FALSE,
    ...
  ) {
    standardGeneric("isRapp")       
  }
)

#' @title
#' Is Package Project
#'
#' @description 
#' See generic: \code{\link[rapp]{isRapp}}
#'      
#' @inheritParams isRapp
#' @param path  \code{\link{missing}}. 
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/isRapp.r
#' @seealso \code{
#'    \link[rapp]{isRapp}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isRapp", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    packrat,
    strict,
    ...
  ) {
  
  return(isRapp(
    path = path,
    packrat = packrat,
    strict = strict,
    ...
  ))
  
  }
)

#' @title
#' Is Package Project
#'
#' @description 
#' See generic: \code{\link[rapp]{isRapp}}
#'      
#' @inheritParams isRapp
#' @param path  \code{\link{character}}. 
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/isRapp.r
#' @seealso \code{
#'    \link[rapp]{isRapp}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isRapp", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    packrat,
    strict,
    ...
  ) {
  
  ## Root directory exist check //
  if (!file.exists(path)) {
    if (!strict) {
      return(FALSE)
    } else {
      rapp::signalCondition(
        condition = c("NegativeRappCheck",
                      "InvalidDirectoryPath"),
        msg = c(
          "Package project check was negative",
          Details = "directory does not exist",
          Path = path
        ),
        ns = "rapp",
        type = "error"
      )
    }
  }    
  
  ## Root directory type check //
  if (!file.info(path)$isdir) {
    if (!strict) {
      return(FALSE)
    } else {
      rapp::signalCondition(
        condition = c("NegativeRappCheck",
                      "NotADirectory"),
        msg = c(
          "Package project check was negative",
          Details = "not a directory",
          Path = path
        ),
        ns = "rapp",
        type = "error"
      )
    }
  }    
    
  ## Patterns/info to look for //    
  pattern_dirs <- c(
    "batch",
    "man",
    "options",
    if (packrat) "packrat" else NULL,
    "R",
    "shiny"
  )    
  pattern_files <- c(
    "DESCRIPTION",
    "NAMESPACE",
    ".rapp"
  )
  pattern_desc <- c(
    "Package",
    "Title",
    "Description",
    "Version",
    "Author",
    "License"
  )
  
  files <- list.files(path, full.names = TRUE, all.files = TRUE)
  finfo <- file.info(files)
  bnames <- basename(files)
  
  ## Existence check //
  idx <- c(pattern_dirs, pattern_files) %in% bnames
  if (!all(idx)) {
    if (!strict) {
      return(FALSE)
    } else {
      rapp::signalCondition(
        condition = c("NegativeRappCheck",
                      "MissingPackageComponents"),
        msg = c(
          "R application check was negative",
          Details = "missing application components",
          Path = path
        ),
        ns = "rapp",
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
      rapp::signalCondition(
        condition = c("NegativeRappCheck",
                      "InvalidRessourceTypes"),
        msg = c(
          "R application check was negative",
          Details = "invalid ressource types",
          Path = path,
          "Missing directories" = names(idx_dirs)[!idx_dirs],
          "Missing files" = names(idx_files)[!idx_files]
        ),
        ns = "rapp",
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
      rapp::signalCondition(
        condition = c("NegativeRappCheck",
                      "InvalidDescriptionFileContent"),
        msg = c(
          "R application check was negative",
          Details = "invalid DESCRIPTION file content",
          Path = path
        ),
        ns = "rapp",
        type = "error"
      )
    }
  }
  
  return(TRUE)
  
  }
)
