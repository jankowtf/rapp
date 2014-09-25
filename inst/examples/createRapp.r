\dontrun{

createRapp(id = "test.rapp", path = tempdir())

## With packrat functionality //
## Only works if you have internet connection!
## Also be aware, that when using RStudio, the R session automatically shuts
## down --> the temporary directory will be deleted.
## Change 'path' to a suitable location to actually being to see the result
createRapp(id = "test.rapp", path = tempdir(), packrat = TRUE)

}
