#' @title
#' Create a New R Application
#'
#' @description 
#' Creates a new R application.
#' 
#' @details
#' As it is sometimes not clear how much "glue code" you might still still in 
#' order to turn your ideas into a functioning application, this function tries
#' to give you the best of both worlds. It contains
#' 
#' \itemize{
#'   \item{\strong{A regular R package project: }} {
#'   
#'   Directory \code{/{app-name}/package} is created via 
#'   \code{\link[devtools]{create}}. Allthough you might not want to turn your
#'   glue code into an actual package: you never know and this project structure offers
#'   you everything you might need further down the road (directories to 
#'   store your documentation, directories for some examples etc.)
#'   
#'   }
#'   \item{\strong{Subdirectory for a shiny app: } \code{shiny}} {
#'   
#'   As the code of your "application R package project" should only contain
#'   "glue code", the actual application will probably be a shiny app. 
#'   The directory contains templates for \code{ui.r} and \code{server.r} that
#'   make for a working shiny app.
#'   
#'   }
#'   \item{\strong{Subdirectory for batch scripts: } \code{shiny}} {
#'   
#'   In case a shiny app is not the right form of implementation for your 
#'   application, you can put your batch scripts in this directory
#'   
#'   }
#'   \item{\strong{Subdirectory for options: } \code{options}} {
#'   
#'   This directory contains two files that let you control runtime options:
#'   \code{options_runtime.r} (controlls the overall behavior of the \code{rapp}
#'   package) and \code{options.r} (the place to state every option that your
#'   application needs)
#'   
#'   }
#'   \item{\strong{Packrat package control: } \code{packrat}} {
#'   
#'   This directory is created via \code{\link{packrat::init()}} and helps 
#'   you keeping track of the packages your application uses.
#'   
#'   As this currently involves internet connection and shuts down the R
#'   session (at least when used with RStudio), this option can be disabled
#'   by \code{packrat = FALSE}. You can initialize a created R application
#'   for the use with \code{packrat} at any time by running \code{\link[packrat]{init}}
#'   }
#' }
#'   	
#' @param id \strong{Signature argument}.
#'    Object containing application ID information.
#' @param path \strong{Signature argument}.
#'    Object containing location information.
#' @param packrat \code{\link{logical}}.
#'    \code{TRUE}: run \code{packrat::init()};
#'    \code{FALSE}: don't initialize with packrat
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: trigger error if certain conditions are met;
#'    \code{FALSE}: return with \code{character()} when these conditions are met.
#' @param github_name \code{\link{character}}.
#'    User name at \href{http://github.com}{GitHub}. If not specified, it is
#'    automatically set to the maintainer information 
#'    \code{{firstname}{lastname}} as specified in the \code{DESCRIPTION} file.
#' @template threedot
#' @example inst/examples/createRappProject.r
#' @seealso \code{
#'   	\link[rapp]{createRappProject-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "createRappProject",
  signature = c(
    "id",
    "path"
  ),
  def = function(
    id,
    path = "rapp/apps",
    packrat = FALSE,
    strict = FALSE,
    github_name = NA_character_,
    ...
  ) {
    standardGeneric("createRappProject")       
  }
)

#' @title
#' Create a New Application
#'
#' @description 
#' See generic: \code{\link[rapp]{createRappProject}}
#'      
#' @inheritParams createRappProject
#' @param id \code{\link{character}}. 
#' @param path \code{\link{missing}}. 
#' @return See method 
#'    \code{\link[rapp]{createRappProject-character-character-method}}. 
#' @example inst/examples/createRappProject.r
#' @seealso \code{
#'    \link[rapp]{createRappProject}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "createRappProject", 
  signature = signature(
    id = "character",
    path = "missing"
  ), 
  definition = function(
    id,
    path,
    packrat,
    strict,
    github_name,
    ...
  ) {
  
  return(createRappProject(
    id = id,
    path = path,
    packrat = packrat,
    strict = strict,
    github_name = github_name,
    ...
  ))
    
  }
)

#' @title
#' Create a New Application
#'
#' @description 
#' See generic: \code{\link[rapp]{createRappProject}}
#'      
#' @inheritParams createRappProject
#' @param id \code{\link{character}}. 
#' @param path \code{\link{character}}. 
#' @return \code{\link{character}}. 
#' @example inst/examples/createRappProject.r
#' @seealso \code{
#'    \link[rapp]{createRappProject}
#' }
#' @template author
#' @template references
#' @export
#' @import pkgKitten
#' @import packrat
setMethod(
  f = "createRappProject", 
  signature = signature(
    id = "character",
    path = "character"
  ), 
  definition = function(
    id,
    path,
    packrat,
    strict,
    github_name,
    ...
  ) {
  
  path_app <- file.path(path, id)    
  if (!file.exists(path)) {
    rapp::signalCondition(
      condition = "InvalidAppParentDirectory",
      msg = c(
        "Parent directory for application does not exist",
        Path = path
      ),
      ns = "rapp",
      type = "error"
    )
  }

  ## Create package project //
  is_project <- isPackageProject(path = path_app)
  if (is_project) {
    if (!strict) {
      return(FALSE)
    } else {
      rapp::signalCondition(
        condition = "ApplicationAlreadyExists", 
        msg = c(
          "Application already exists",
          ID = id,
          Path = path
        ),
        ns = "rapp",
        type = "error"
      )
    }
  } else {
#     devtools::?create(path = path_app)
#     suppressMessages(package.skeleton(name = id, path = path,
#                                       environment = new.env()))
#     suppressMessages(kitten(name = id, path = path))
    createPackageSkeleton(id = id, path = path, github_name = github_name)

    ## Subdirectory: shiny app //
    path_shiny <- file.path(path_app, "shiny")
    dir.create(path_shiny, recursive = TRUE, showWarnings = FALSE)
    path_ui <- system.file("inst/templates/shiny/ui.r", package = "rapp")
    path_server <- system.file("inst/templates/shiny/server.r", 
                               package = "rapp")
    sapply(c(path_ui, path_server), file.copy, to = path_shiny)
  
    ## Subdirectory: batch //
    dir.create(file.path(path_app, "batch"), showWarnings = FALSE)
  
    ## Subdirectory: options //
    path_options <- file.path(path_app, "options")
    dir.create(path_options, showWarnings = FALSE)
    
    ## Ensure option files //
    ensureRappOptionFiles()
    
    ## Rapp info file //
    vsn <- unname(read.dcf(system.file("DESCRIPTION"), field = "Version")[,1])
    rapp_info <- list(version = vsn)
    write.dcf(as.data.frame(rapp_info), file = file.path(path_app, ".rapp"))
    
    ## Packrat //
    if (packrat) {
      packrat::init(project = path_app)
    }
  }
  return(path_app)

})
