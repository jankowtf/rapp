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

## Investigate current project content //
.openDirectory(pkg_path)

## Ensure additional project components //
ensureProjectComponents(path = pkg_path)

## Investigate updated project content //
.openDirectory(pkg_path)

## Clean up //
on.exit(.cleanTempDir(x = tempdir()), add = TRUE)

}
