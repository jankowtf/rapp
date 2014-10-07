#' @title
#' Create Roxygen Templates
#' 
#' @description 
#' Creates roxygen templates in directory \code{man-roxygen}.
#' 
#' @details
#' Currently, the following templates are created:
#' \itemize{
#'  \item{\code{author}: }{
#'  
#'    \code{#' @@author {firstname} {lastname} \email{{email}}}
#'    
#'    The author information is taken from the\code{Maintainer} field 
#'    in the \code{DESCRIPTION} file.
#'  }
#'  \item{\code{references}: }{
#'  
#'    \code{#' @@references \url{http://github.com/{github-name}/{package-name}}}
#'    
#'    The \code{{package-name}} information is taken from the \code{Package} field 
#'    of the \code{DESCRIPTION} file and the \code{github-name} can be provided 
#'    via argument \code{github_name}. If not specified, it is taken from
#'    the \code{Maintainer} field of the \code{DESCRIPTION} file.
#' }
#'  \item{\code{threedots}: }{
#'  
#'    \code{#' @@param ... Further arguments to be passed to subsequent functions/methods.}
#'  }
#' }
#' 
#' @param path \strong{Signature argument}.
#'    Object containing location information.
#' @param github_name \code{\link{character}}.
#'    User name at \href{http://github.com}{GitHub}. If not specified, it is
#'    automatically set to the maintainer information 
#'    \code{{firstname}{lastname}} as specified in the \code{DESCRIPTION} file.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: \code{path} must point to a valid package project;
#'    \code{FALSE}: \code{path} can point to any existing directory.
#' @template threedot
#' @example inst/examples/ensureRoxygenTemplates.r
#' @seealso \code{
#'   	\link[rapp]{ensureRoxygenTemplates-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "ensureRoxygenTemplates",
  signature = c(
    "path"
  ),
  def = function(
    path,
    github_name = NA_character_,
    strict = FALSE,
    ...
  ) {
    standardGeneric("ensureRoxygenTemplates")       
  }
)

#' @title
#' Create Roxygen Templates
#'
#' @description 
#' See generic: \code{\link[rapp]{ensureRoxygenTemplates}}
#'      
#' @inheritParams ensureRoxygenTemplates
#' @param path \code{\link{character}}. 
#' @return \code{\link{character}}. File paths of the files that were created. 
#' @example inst/examples/ensureRoxygenTemplates.r
#' @seealso \code{
#'    \link[rapp]{ensureRoxygenTemplates}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureRoxygenTemplates", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    github_name,
    strict,
    ...
  ) {
  
  ## Validation //
  if (strict) {
    isPackageProject(path = path, strict = TRUE)
  } else {
    if (!file.exists(path)) {
      rapp::signalCondition(
        condition = "DirectoryDoesNotExist",
        msg = c(
          "Directory does not exist",
          Path = path
        ),
        ns = "rapp",
        type = "error"
      )
    }
  }
    
  ## Read description file //
  desc <- as.list(read.dcf("DESCRIPTION")[1,])
  pkg <- desc$Package
  maint <- desc$Maintainer
  maint <- gsub("\\s*$|>$", "", unlist(strsplit(maint, split = "<")))
  if (length(maint) != 2) {
    rapp::signalCondition(
      condition = "InvalidMaintainerFieldInDescription",
      msg = c(
        "Invalid 'maintainer' field in DESCRIPTION file",
        Details = "expecting {firstname} {lastname} <{email}>"
      ),
      ns = "rapp",
      type = "error"
    )
  } 
  if (is.na(github_name)) {
    maint[3] <- gsub("\\s*", "", tolower(maint[1]))
  } else {
    maint[3] <- github_name
  }
  
  ## Directory 'man-roxygen' //
  path_man_roxy <- file.path(path, "man-roxygen")
  dir.create(path_man_roxy, showWarnings = FALSE)
  tmp <- sprintf("#' @author %s \\email{%s}", maint[1], gsub("@", "@@", maint[2]))
  path_author <- file.path(path_man_roxy, "author.r")
  write(tmp, file = path_author)
  tmp <- sprintf("#' @references \\url{http://github.com/%s/%s}", maint[3], pkg)
  path_references <- file.path(path_man_roxy, "references.r")
  write(tmp, file = path_references)
  path_threedots <- file.path(path_man_roxy, "threedots.r")
  write("#' @param ... Further arguments to be passed to subsequent functions/methods.", 
    file = path_threedots)        
  out <- c(path_author, path_references, path_threedots)
  
  return(out)

})
