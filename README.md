rapp (v0.2.2)
======

Runtime environment for package development and application deployment in the context of the rapp framework.

## Installation

```
require("devtools")
devtools::install_github("Rappster/examplr")
devtools::install_github("Rappster/libr")
devtools::install_github("Rappster/repositr")
require("rapp")
```

## Ensure runtime environment

```
## Create example package //
createPackageSkeleton(id = "test.package", path = tempdir())
path_pkg <- file.path(tempdir(), "test.package")

## Temporarily change working directory //
wd_0 <- setwd(path_pkg)

## Ensure runtime environment //
ensureRappRuntime()

## Inspect //
filesystr::openRessource()
## --> note directories 'apps' and 'options'
```

## Rapp options

## Internal runtime options

Note that you can modify options via the option file: `/options/options_runtime.r`

```
ls(getOption(".rapp"), all.names = TRUE)

## Runtime options //
ls(getOption(".rapp")$.rte, all.names = TRUE)

## Requires "full path" //
getRappOption(".rte/global_dir")
getRappOption(".rte/lib")

getRappOption(".rte/repos_dev_global")
getRappOption(".rte/repos_dev_pkgs")
getRappOption(".rte/repos_dev_pkg")

getRappOption(".rte/repos_test_global")
getRappOption(".rte/repos_test_pkgs")
getRappOption(".rte/repos_test_pkg")

getRappOption(".rte/repos_live_global")
getRappOption(".rte/repos_live_pkgs")
getRappOption(".rte/repos_live_pkg")

## As 'runtime_mode' has been set to 'dev':
getRappOption(".rte/runtime_mode")
getRappOption(".rte/repos_global")
getRappOption(".rte/repos_pkgs")
getRappOption(".rte/repos_pkg")
## TODO: 
```

### Namespace-specific runtime options

Note that you can add/modify options via the option file: `/options/options_ns.r`

```
ls(getOption(".rapp")$test.package, all.names = TRUE)

getRappOption("test.package/github_name")
getRappOption("test.package/global_dir")
getRappOption("test.package/ns")

getNsRappOption(id = "github_name")
getNsRappOption(id = "global_dir")
getNsRappOption(id = "ns")

getNsRappOption(ns = "test.package", id = "github_name")
getNsRappOption(ns = "test.package", id = "global_dir")
getNsRappOption(ns = "test.package", id = "ns")
```

## Create rapp project

Per default, `rapp` with name `test` is already created in directory `/apps/`:
`/apps/test`

```
createRappProject(id = "test.rapp", path = tempdir())

## Inspect //
path_rapp <- file.path(tempdir(), "test.rapp")
filesystr::openRessource(path_rapp)
## --> note directories 'batch' and 'options' and 'shiny'
```

## Convenience functions/methods

```
getGlobalDirectory()
getLibrary()
getRuntimeMode()
hasOptionFile()
hasRuntimeOptionFile()
isPackageProject()
isPackageProject(path_rapp)
isRapp()
isRapp(path_rapp)
isRappOptionSet(id = ".rte/global_dir")
isRappOptionSet(id = ".rte/non_existing_option")
isRappRuntime()
```
