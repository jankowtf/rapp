\dontrun{

## Save current option state //
opts_old <- getOption(".rapp")

ensureGlobalDirectory()
getRappOption(".rte/global_dir")
file.exists(getRappOption(".rte/global_dir"))

ensureGlobalDirectory(path = file.path(tempdir(), "rapp"))
getRappOption(".rte/global_dir")
file.exists(getRappOption(".rte/global_dir"))

## Clean up //
options(".rapp" = opts_old)

}
