# CHANGES IN rapp.core.rte VERSION 0.1.0.12

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

- added argument `opts` to `ensureRuntimeEnvironment()`: allows to pass read options in order to transfer some runtime options to internal `.rte` options.
Not fully elaborated yet.

## MINOR CHANGES

- added runtime option `rapp_global` in `initializeRappOptions()`
- added runtime option `path_app` in `initializeRappOptions()`

## MISC 

-----

# CHANGES IN rapp.core.rte VERSION 0.1.0.11

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

- added `path_app` to the runtime options (`/rapp/options/options_runtime.r`)
- changed directory structure for apps in `/rapp/apps/`: options are now located below `/rapp/apps/<app-name>/rapp/options/` in order to be consitent with respect to the structure of the `/rapp` directory in the package project's root directory.
- changed behavior for package- and app-specific option files in `ensureRappDirectoryComponents()`. 

## MINOR CHANGES

- modified unit test for `ensureProjectComponents()`
- experimented with `.onAttach()` and `onLoad()`

## MISC 

-----

# CHANGES IN rapp.core.rte VERSION 0.1.0.10

## NEW FEATURES

- added `tidySource()` which is mainly used to write `/options/options.r` and `/options/options_runtime.r`
## BUG FIXES

- `ensureRuntimeEnvironment()` takes care of ensuring the existence of the default `rapp_global` directory.

## MAJOR CHANGES

- rename: `ensureRuntimeEnvironment()` --> `ensureRuntimeEnvironment()`
- rename: `initializeRappOptions()` --> `initializeRappOptions()`
- added `overwrite` argument to `ensureProjectComponents()`
- added `overwrite` argument to `ensureRappDirectoryComponents()`
- changed the way option templates are created in `ensureRappDirectoryComponents()` (`tidySource`).

## MINOR CHANGES

## MISC 

-----

# CHANGES IN rapp.core.rte VERSION 0.1.0.9

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

- renamed: `*RappHome()` to `*RappGlobal()`

## MINOR CHANGES

- `ensureNamespaceRappOptions()`:
  Changed option `context_home` to `ns_global` for consistency reasons
- rename: `ns_home` in `ns_global`  
- rename: `rapp_global` in `rapp_global`  
- Directory `contexts` in `rapp_global` directory renamed to `ns` for 
  consistency reasons

## MISC 

-----

# CHANGES IN rapp.core.rte VERSION 0.1.0.8

## NEW FEATURES

## BUG FIXES

- `ensureRappDirectoryComponents()`:
  Option files are only written they don't exist yet

## MAJOR CHANGES

## MINOR CHANGES

## MISC 

-----

# CHANGES IN rapp.core.rte VERSION 0.1.0.7

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

- `ensureRappDirectoryComponents()`:
  option file content is a bit more generic (`lib = .libPaths()[1]` instead
  of explicit file path)

## MISC 

-----

# CHANGES IN rapp.core.rte VERSION 0.1.0.6

## NEW FEATURES

- Ensured the creation of certain project components via 
  `ensureProjectComponents()` and `ensureRappDirectoryComponents()`.
- Config files for options: `rapp/options_runtime.r` (runtime specific options) and `rapp/options.r` (package project specific options)
- Added `rapp/apps` directory with a demo app `test`. Each app directory has
  the following structure: 
  - `./options`: contains `options_runtime.r` and `options.r`
  - `./R`: R scripts
- `ensureRuntimeEnvironment()` is now able to read options from 
  `/rapp/options/options_runtime.r` (see method for signature `missing`)
- new: `hasOptionFile()`: checks for existence of `options.r`
- new: `hasRuntimeOptionFile()`: checks for existence of `options_runtime.r`
- new: `readRuntimeOptionFile()`: reads option file content

## BUG FIXES

## MAJOR CHANGES

- What previously was called a *context*  is now referred to as a *namespace* 
throughout the package
- Rename: `ensureContextRappOptions()` --> `ensureNamespaceRappOptions()`
- Rename: `setContextRappOption()` --> `setNamespaceRappOption()`
- Rename: `getContextRappOption()` --> `getNamespaceRappOption()`
- Rename: `setRuntimeStage()` --> `setRuntimeMode()`
- Rename: `getRuntimeStage()` --> `getRuntimeMode()`
- Argument `ctx` changed to `ns` in various functions/methods
- Argument `runtime_stage` changed to `runtime_mode` in various functions/methods
- Ensure creation of `vignettes` subdirectory in `ensureRuntimeEnvironment()`

## MINOR CHANGES
  
## MISC 

-----

# CHANGES IN rapp.core.rte VERSION 0.1.0.5

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

- `ensureNamespaceRappOptions()`:
  - ensured that context directory is created below `<rapp_global>/contexts/`
- `ensureRappGlobal()`:
  - ensured that root directory for context data is created: `<rapp_global>/contexts/`
- `getLibrary()`: 
  - enabled pass-through of `...` arguments 
- `getRappGlobal()`: 
  - enabled pass-through of `...` arguments 
- `getRuntimeMode()`: 
  - enabled pass-through of `...` arguments 
  
## MISC 

-----

# CHANGES IN rapp.core.rte VERSION 0.1.0.4

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC 

- first release candidate

-----