\dontrun{

## Save current option state //
opts_old <- getOption(".rapp")

## Prerequisites //
ensureRappGlobal()
getRappOption(".rte/rapp_global")

setInternalRepositories()
getRappOption(".rte/repos_root")
getRappOption(".rte/repos_dev_global")
getRappOption(".rte/repos_test_global")
getRappOption(".rte/repos_live_global")
getRappOption(".rte/repos_dev_pkgs")
getRappOption(".rte/repos_test_pkgs")
getRappOption(".rte/repos_live_pkgs")

getRappOption(".rte/repos_global")
getRappOption(".rte/repos_package")
             
## Clean up //
on.exit(options(".rapp" = opts_old))

}
