\dontrun{

createRapp(id = "test", path = tempdir())

path_app <- file.path(tempdir(), "test")
isRapp(path = path_app)

## Carefull!
unlink(file.path(path_app, "shiny"), recursive = TRUE)
isRapp(path = path_app)

}
