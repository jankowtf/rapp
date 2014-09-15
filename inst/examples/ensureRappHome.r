\dontrun{

## Save current option state //
opts_old <- getOption(".rapp")

ensureRappHome()
getRappOption(".rte/rapp_home")
file.exists(getRappOption(".rte/rapp_home"))

ensureRappHome(path = file.path(tempdir(), "rapp"))
getRappOption(".rte/rapp_home")
file.exists(getRappOption(".rte/rapp_home"))

## Clean up //
options(".rapp" = opts_old)

}
