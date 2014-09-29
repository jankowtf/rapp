\dontrun{

## Auxliary function //  
.cleanTempDir <- function(x) {
  if (grepl(basename(tempdir()), x)) {
    unlink(x, recursive = TRUE, force = TRUE)
  }
}  
  
## Create //
path <- createPackageProject(id = "test.package", path = tempdir())

## If 'overwrite = FALSE' --> error if project already exists:
try(createPackageProject(id = "test.package", path = tempdir()))
createPackageProject(id = "test.package", path = tempdir(), overwrite = TRUE)

## Clean upp //
.cleanTempDir(x = path)

}
