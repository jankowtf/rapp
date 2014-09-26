#' @title
#' Tidy Source Code
#'
#' @description 
#' Tidies source code based on certain conventions.
#'   	
#' @param input \strong{Signature argument}.
#'    Object containing code input information.
#' @param name \strong{Signature argument}.
#'    Object containing assignment name information.
#' @template threedot
#' @example inst/examples/tidySource.r
#' @seealso \code{
#'   	\link[rapptime]{tidySource-ANY-character-method}
#' }
#' @template author
#' @template references
#' @export 
#' @import rapp.core.package
setGeneric(
  name = "tidySource",
  signature = c(
    "input",
    "name"
  ),
  def = function(
    input,
    name,
    ...
  ) {
    standardGeneric("tidySource")       
  }
)

#' @title
#' Tidy Source Code
#'
#' @description 
#' See generic: \code{\link[rapptime]{tidySource}}
#'      
#' @inheritParams tidySource
#' @param input \code{\link{call}}.
#' @param name \code{\link{missing}}.
#' @return See method 
#'    \code{\link[rapp.core.tidy]{tidySource-call-character-method}}.
#' @example inst/examples/tidySource.r
#' @seealso \code{
#'    \link[rapptime]{tidySource}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "tidySource", 
  signature = signature(
    input = "call",
    name = "missing"
  ), 
  definition = function(
    input,
    name,
    ...
  ) {

  return(tidySource(
    input = input, 
    name = character(),
    ...
  ))
  
  }
)

#' @title
#' Tidy Source Code
#'
#' @description 
#' See generic: \code{\link[rapptime]{tidySource}}
#'      
#' @inheritParams tidySource
#' @param input \code{\link{call}}.
#' @param name \code{\link{character}}.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/tidySource.r
#' @seealso \code{
#'    \link[rapptime]{tidySource}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "tidySource", 
  signature = signature(
    input = "call",
    name = "character"
  ), 
  definition = function(
    input,
    name,
    ...
  ) {

#   expr <- unlist(strsplit(deparse(input, control = NULL), split = ","))
#   expr <- gsub("^\\s*$|(^\\s*(?=\\w))", "", expr, perl = TRUE)
#   expr <- expr[(expr != "")]
#   expr <- unlist(strsplit(expr, split = "(?<=list)\\(|\\)$", perl = TRUE))
#   expr <- paste0(name, " <- ", expr[1], 
#      "(\n\t", paste(expr[2:length(expr)], collapse=",\n\t"), "\n)")
#   expr

  nms <- names(input)    
  expr <- c(
    paste0(deparse(input[[1]]), "("),
    sapply(2:length(nms), function(ii) {
      paste0("\t", nms[ii], " = ", deparse(input[[ii]]),
             ifelse (ii < length(nms), ",", ""))
    }),
    ")"
  )
  
  if (length(name)) {
    expr <- paste0(name, " <- ", paste(expr, collapse = "\n"))
  } else {
    expr <- paste(expr, collapse = "\n")
  }
  
  return(expr)
  
  }
)

#' @title
#' Tidy Source Code
#'
#' @description 
#' See generic: \code{\link[rapptime]{tidySource}}
#'      
#' @inheritParams tidySource
#' @param input \code{\link{<-}}.
#' @param name \code{\link{missing}}.
#' @return See method 
#'    \code{\link[rapp.core.tidy]{tidySource-<--character-method}}.
#' @example inst/examples/tidySource.r
#' @seealso \code{
#'    \link[rapptime]{tidySource}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "tidySource", 
  signature = signature(
    input = "<-",
    name = "missing"
  ), 
  definition = function(
    input,
    name,
    ...
  ) {

  return(tidySource(
    input = input, 
    name = character(),
    ...
  ))
  
  }
)

#' @title
#' Tidy Source Code
#'
#' @description 
#' See generic: \code{\link[rapptime]{tidySource}}
#'      
#' @inheritParams tidySource
#' @param input \code{\link{<-}}.
#' @param name \code{\link{character}}.
#' @return \code{\link{character}}. Option value.
#' @example inst/examples/tidySource.r
#' @seealso \code{
#'    \link[rapptime]{tidySource}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "tidySource", 
  signature = signature(
    input = "<-",
    name = "character"
  ), 
  definition = function(
    input,
    name,
    ...
  ) {

  nms <- names(input)
  input[[1]]
  input[[3]]
  expr <- c(
    deparse(input[[2]]),
    paste0(" ", deparse(input[[1]]), " "),
    paste(deparse(input[[3]]), collapse = "\n")
#     sapply(2:length(nms), function(ii) {
#       paste0("\t", nms[ii], " = ", deparse(input[[ii]]),
#              ifelse (ii < length(nms), ",", ""))
#     }),
  )
  
  if (length(name)) {
    expr <- paste0(name, " <- ", paste(expr, collapse = "\n"))
  } else {
    expr <- paste(expr, collapse = "")
  }
#   cat(expr)

  return(expr)
  
  }
)
