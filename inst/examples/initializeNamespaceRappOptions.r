\dontrun{

## Auxiliary functions //
.cleanTempDir <- function(x) {
  if (grepl(basename(tempdir()), x)) {
    unlink(x, recursive = TRUE, force = TRUE)
  }
}

## Save current options status //
opts_old <- getOption(".rapp")

## Create dummy package project //
path <- file.path(tempdir(), "test")
ns <- basename(path)
package.skeleton(
  name = ns,
  path = dirname(path),
  force = TRUE
)

## Temporarily change working directory //
## Don't forget to undo this at the very end
wd_0 <- setwd(path)

## Initialize system rapp options (prerequisite) //
initializeRappOptions()

## Initialize namespace rapp options //
res <- initializeNamespaceRappOptions()
ls(res, all.names=TRUE)
## Element '.rte' corresponds to system rapp options, element 'test' to the 
## rapp options for the namespace, i.e. the package 'test'.

## Inspect default option values //
ls(res[[ns]], all.names=TRUE)
## Namespace:
getNamespaceRappOption(ns = ns, id = "ns")
## Global application directory for namespace:
getNamespaceRappOption(ns = ns, id = "global_dir")
## Directory of an internal app ('/rapp/apps/<app-name>'):
getNamespaceRappOption(ns = ns, id = "path_app")

## Clean up //
setwd(wd_0)
options(".rapp" = opts_old)
.cleanTempDir(x = path)

}
