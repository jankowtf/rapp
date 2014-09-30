\dontrun{

## Auxliary function //  
.cleanTempDir <- function(x) {
  if (grepl(basename(tempdir()), x)) {
    unlink(x, recursive = TRUE, force = TRUE)
  }
}

path <- createPackageSkeleton(id = "test.package", 
  path = tempdir(), overwrite = TRUE)
res <- ensureRoxygenTemplates(path = path)
res <- ensureRoxygenTemplates(path = path)
## --> take a look at file '/man_roxygen/references.r'

## Clean up //
.cleanTempDir(x = path)  

}
