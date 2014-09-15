\dontrun{

## Create example content //  
path_0 <- file.path(tempdir(), "package_root")
dir.create(path_0)
paths <- file.path(path_0, c("package.valid", paste0("package.invalid.", 1:4)))

sapply(seq(along = paths), function(ii) {
  package.skeleton(name = basename(paths[ii]), path = path_0, force = TRUE)
  if (ii == 2) {
    unlink(file.path(paths[ii], "man"), force = TRUE, recursive = TRUE)
  }
  if (ii == 3) {
    tmp <- file.path(paths[ii], "DESCRIPTION")
    file.remove(tmp)
    dir.create(tmp)
  }
  if (ii == 4) {
    tmp <- file.path(paths[ii], "DESCRIPTION")
    cnt <- readLines(tmp)[-1]
    write(cnt, file = tmp)
  }
  if (ii == 5) {
    tmp <- file.path(paths[ii], "DESCRIPTION")
    write(NULL, file = tmp)
  }
})

## Apply function //
isPackageProject(path = paths[1])
isPackageProject(path = paths[2])
isPackageProject(path = paths[2], strict = TRUE)

isPackageProject(path = paths[3])
isPackageProject(path = paths[3], strict = TRUE)

isPackageProject(path = paths[4])
isPackageProject(path = paths[4], strict = TRUE)

isPackageProject(path = paths[5])
isPackageProject(path = paths[5], strict = TRUE)

}
