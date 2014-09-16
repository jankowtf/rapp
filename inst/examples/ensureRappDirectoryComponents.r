\dontrun{

## Auxiliary function //
.cleanTempDir <- function(x) {
  if (grepl(basename(tempdir()), x)) {
    unlink(x, recursive = TRUE, force = TRUE)
  }
}
.openDirectory <- function(dir = getwd()){
  if (.Platform['OS.type'] == "windows"){
    shell.exec(dir)
  } else {
    system(paste(Sys.getenv("R_BROWSER"), dir))
  }
}

## Create dummy package project //
package.skeleton(
  name = "test",
  path = tempdir(),
  force = TRUE
)

## Temporarily change working directory //
pkg_path <- file.path(tempdir(), "test")
wd_0 <- setwd(pkg_path)

## Investigate current project content //
.openDirectory(pkg_path)

## Ensure additional project components //
ensureRappDirectoryComponents()

## Investigate updated project content //
.openDirectory(pkg_path)

## Clean up //
setwd(wd_0)
on.exit(.cleanTempDir(x = tempdir()), add = TRUE)

}
