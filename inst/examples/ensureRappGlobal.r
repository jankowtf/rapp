\dontrun{

## Save current option state //
opts_old <- getOption(".rapp")

ensureRappGlobal()
getRappOption(".rte/rapp_global")
file.exists(getRappOption(".rte/rapp_global"))

ensureRappGlobal(path = file.path(tempdir(), "rapp"))
getRappOption(".rte/rapp_global")
file.exists(getRappOption(".rte/rapp_global"))

## Clean up //
options(".rapp" = opts_old)

}
