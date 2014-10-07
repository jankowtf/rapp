# CHANGES IN rapp VERSION 0.2.4

## NEW FEATURES

## BUG FIXES

- fixed: #2
- fixed: #3
- fixed: #4
- fixed: #5

## MAJOR CHANGES

## MINOR CHANGES

## MISC

-----

# CHANGES IN rapp VERSION 0.2.2

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC

-----

# CHANGES IN rapp VERSION 0.2.1

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC

-----

# CHANGES IN rapp VERSION 0.2

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC

-----

# CHANGES IN rapp VERSION 0.1.5

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC

-----

# CHANGES IN rapp VERSION 0.1.4

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC

-----

# CHANGES IN rapp VERSION 0.1.3

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC

-----

# CHANGES IN rapp VERSION 0.1.2

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC

- cleanup commit

-----

# CHANGES IN rapp VERSION 0.1.0.13

## NEW FEATURES

- added `initializeNamespaceRappOptions()`

## BUG FIXES

## MAJOR CHANGES

- rename: `ensureNamespaceRappOptions()` --> `mergeNamespaceRappOptions()`.
  This better reflects the purpose of merging initial namespace options and the ones specified in the option file `/options/options_ns.r`.
- rename: `renameRuntimeOptionFile()` --> `renameRappOptionFile()`.
  This is more consistent with the overall naming conventions used.
- improved: `setRappOption()`.
  Numerical option names can handled (e.g. `20140101`).  
- improved: `getRappOption()`.
  Numerical option names can now be handled (e.g. `20140101`)

## MINOR CHANGES

- added namespace option `path_app` (`initializeNamespaceRappOptions()`) and removed the respective system option (`initializeRappOptions()`)

## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.12

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

- added argument `opts` to `ensureRapptime()`: allows to pass read options in order to transfer some runtime options to internal `.rte` options.
Not fully elaborated yet.

## MINOR CHANGES

- added runtime option `global_dir` in `initializeRappOptions()`
- added runtime option `path_app` in `initializeRappOptions()`

## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.11

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

- added `path_app` to the runtime options (`/options/options_runtime.r`)
- changed directory structure for apps in `/rapp/apps/`: options are now located below `/rapp/apps/<app-name>/options/` in order to be consitent with respect to the structure of the `/rapp` directory in the package project's root directory.
- changed behavior for package- and app-specific option files in `ensureRappComponents()`. 

## MINOR CHANGES

- modified unit test for `ensureProjectComponents()`
- experimented with `.onAttach()` and `onLoad()`

## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.10

## NEW FEATURES

- added `tidySource()` which is mainly used to write `/options/options_ns.r` and `/options/options_runtime.r`
## BUG FIXES

- `ensureRapptime()` takes care of ensuring the existence of the default `global_dir` directory.

## MAJOR CHANGES

- rename: `ensureRapptime()` --> `ensureRapptime()`
- rename: `initializeRappOptions()` --> `initializeRappOptions()`
- added `overwrite` argument to `ensureProjectComponents()`
- added `overwrite` argument to `ensureRappComponents()`
- changed the way option templates are created in `ensureRappComponents()` (`tidySource`).

## MINOR CHANGES

## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.9

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

- renamed: `*RappHome()` to `*RappGlobal()`

## MINOR CHANGES

- `mergeNamespaceRappOptions()`:
  Changed option `context_home` to `global_dir` for consistency reasons
- rename: `ns_home` in `global_dir`  
- rename: `global_dir` in `global_dir`  
- Directory `contexts` in `global_dir` directory renamed to `ns` for 
  consistency reasons

## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.8

## NEW FEATURES

## BUG FIXES

- `ensureRappComponents()`:
  Option files are only written they don't exist yet

## MAJOR CHANGES

## MINOR CHANGES

## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.7

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

- `ensureRappComponents()`:
  option file content is a bit more generic (`lib = .libPaths()[1]` instead
  of explicit file path)

## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.6

## NEW FEATURES

- Ensured the creation of certain project components via 
  `ensureProjectComponents()` and `ensureRappComponents()`.
- Config files for options: `options_runtime.r` (runtime specific options) and `options.r` (package project specific options)
- Added `rapp/apps` directory with a demo app `test`. Each app directory has
  the following structure: 
  - `./options`: contains `options_runtime.r` and `options.r`
  - `./R`: R scripts
- `ensureRapptime()` is now able to read options from 
  `/options/options_runtime.r` (see method for signature `missing`)
- new: `hasOptionFile()`: checks for existence of `options.r`
- new: `hasRuntimeOptionFile()`: checks for existence of `options_runtime.r`
- new: `readRappOptionFile()`: reads option file content

## BUG FIXES

## MAJOR CHANGES

- What previously was called a *context*  is now referred to as a *namespace* 
throughout the package
- Rename: `ensureContextRappOptions()` --> `mergeNamespaceRappOptions()`
- Rename: `setContextRappOption()` --> `setNamespaceRappOption()`
- Rename: `getContextRappOption()` --> `getNamespaceRappOption()`
- Rename: `setRuntimeStage()` --> `setRuntimeMode()`
- Rename: `getRuntimeStage()` --> `getRuntimeMode()`
- Argument `ctx` changed to `ns` in various functions/methods
- Argument `runtime_stage` changed to `runtime_mode` in various functions/methods
- Ensure creation of `vignettes` subdirectory in `ensureRapptime()`

## MINOR CHANGES
  
## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.5

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

- `mergeNamespaceRappOptions()`:
  - ensured that context directory is created below `<global_dir>/contexts/`
- `ensureGlobalDirectory()`:
  - ensured that root directory for context data is created: `<global_dir>/contexts/`
- `getLibrary()`: 
  - enabled pass-through of `...` arguments 
- `getGlobalDirectory()`: 
  - enabled pass-through of `...` arguments 
- `getRuntimeMode()`: 
  - enabled pass-through of `...` arguments 
  
## MISC 

-----

# CHANGES IN rapp VERSION 0.1.0.4

## NEW FEATURES

## BUG FIXES

## MAJOR CHANGES

## MINOR CHANGES

## MISC 

- first release candidate

-----
