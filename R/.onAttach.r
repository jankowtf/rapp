#' On Attach Hook
#'
#' @description 
#' On attach hook.
#' 
#' @param libname 
#' @param pkgname
#' @template author
#' @template references
.onAttach <- function(libname, pkgname) {
  
vsn <- packageDescription("rapptime", field = "Version")
msg <- paste0("Package 'rapptime' (v", vsn, ")")
packageStartupMessage(msg, appendLF = TRUE)
  
}
