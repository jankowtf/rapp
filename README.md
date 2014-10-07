rapp (v0.2.3)
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

Suggested

```
devtools::install_github("Rappster/filesystr")
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
rapp_opts <- getRappOptions()

## Same as:
rapp_opts <- getOption(".rapp")

## Inspect //
ls(rapp_opts, all.names = TRUE)

## Runtime options only //
ls(getOption(".rapp")$.rte, all.names = TRUE)

## Get specific options via "option path" //
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
## TODO: #1
getRappOption(".rte/repos_pkg")
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

## Load internal R application 

Internal R applications should be placed below directory `/apps`.

Per default, there already exists an R application of name `test`

```
## Ensure runtime //
ensureRappRuntime()

## Load //
loadInternalRapp(id = "test")

## Working directory has changed //
getwd()

## Inspect R application project //
filesystr::openRessource()

## Get global application directory //
getNsRappOption(id = "global_dir")

## Unload again //
unloadInternalRapp(id = "test")
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
