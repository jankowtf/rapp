\dontrun{

## Create dummy package //
path <- createPackageProject(id = "test.package", 
  path = tempdir(), overwrite = TRUE)
path_pkg <- file.path(tempdir(), "test.package")

## Temporarily witch working directory //
## Don't forget to reset at the end!
wd_0 <- setwd(path_pkg)

## Inspect package project //
filesystr::openRessource()
## --> we will load the internal R app 'test' in directory '/apps'

## Load internal R application //
loadInternalRapp(id = "test")

## NOTE
## As long as 'strict = FALSE', the function gracefully handles subsequent
## loads even though actually each load needs to be followd by an unload
## ('unloadInternalRapp()') due to the switch of working directories.
## This is especially usefull if you want to reload an application
## because, for example, you forgot to specify a certain option that you need. 
## If 'strict = TRUE', an error is thrown for subsequent loads.
loadInternalRapp(id = "test")
try(loadInternalRapp(id = "test", strict = TRUE))

## Investigate implications //
## Current search path state:
search()
"test" %in% loadedNamespaces()
## Current state of options container:
ls(getOption(".rapp"), all.names = TRUE)
## --> notice that a new subcontainer for 'test' has been added 

## Check global application directory //
getNsRappOption(id = "global_dir")
## --> notice that the global directory is below the global directory 
## of the project that loaded the app (i.e. 'test.package') and this in turn
## is below the 'ns' directory of the rapp runtime's global directory 
## (i.e. 'rapp')
getNsRappOption(ns = "test.package", id = "global_dir")
getRappOption(id = ".rte/global_dir")

## Unload again //
unloadInternalRapp(id = "test")

## Investigate implications //
## Current search path state:
search()
"test" %in% loadedNamespaces()
## Current state of options container:
ls(getOption(".rapp"), all.names = TRUE)
## --> notice that a subcontainer for 'test' has been removed again 

## Cleanup //
setwd(wd_0)

}
