#' @title
#' Runtime environment for package development and application 
#' deployment in the context of the rapp framework
#'
#' @description
#' Ensures the existence of components that are useful for both
#' package development as well as application deployment in the 
#' context of therapp framework.
#' 
#' @details 
#' 
#' The core functions/methods of this package: 
#'  \itemize{
#'    \item{\code{\link[rapp]{ensureRappRuntime}}: }{
#'    
#'      Ensures the systematic management of options by assigning environment
#'      to the option \code{".rapp"} (see \code{getOption(".rapp")}. 
#'      Within that environment, there exists an environment \code{.rapp} 
#'      for runtime options. These can also be controlled via the options file
#'      \code{./options/options_runtime.r}. 
#'      
#'      There also exist respective "namespace" environments for 
#'      packages/applications using the runtime 
#'      (e.g. \code{getOption(".rapp")$mypackage}). These can be used to set 
#'      arbitrary options as needed by a package/application. The options
#'      can be defined via option file \code{./options/options_ns.r}.
#'      
#'      The function also ensures that the following project components exist:
#'      directory \code{apps} containing an R application called \code{test}, 
#'      directory \code{man-roxygen}, files \code{options/options_runtime.r} 
#'      and \code{options/options_ns.r},
#'      directory \code{tests/testthat/data}, directory \code{vignettes}
#'    }
#'    \item{\code{\link[rapp]{createRappProject}}: }{
#'    
#'      Creates an R application (project) that consists of a regular R package
#'      project suplemented with the following components: directory \code{batch}
#'      (for batch scripts), files \code{options/options_runtime.r} and 
#'      \code{options/options_ns.}, files \code{shiny/server.r} and 
#'      \code{shiny/ui.r} (a shiny application) and file \code{.rapp} (internal
#'      system file to track certain rapp-related things like the framework 
#'      version).
#'    }
#' }
#' 
#' @template author
#' @template references
#' @docType package
#' @name rapp
#' @seealso \url{http://git-scm.com}, \url{https://github.com/}
NULL
