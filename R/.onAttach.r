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
  
vsn <- packageDescription("rapp", field = "Version")
msg <- paste0("Package 'rapp' (v", vsn, ")")
packageStartupMessage(msg, appendLF = TRUE)
  
}
