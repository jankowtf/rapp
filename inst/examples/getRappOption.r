\dontrun{

## Save current option state //  
opts_old <- getOption(".rapp")

## Create example content //
container <- initializeRappOptions()
cont_this <- getRappOption(id = ".rte")

setRappOption(id = ".rte/test", value = TRUE)

getRappOption(id = ".rte/test")
getRappOption(id = ".rte/abcd")
getRappOption(id = ".rte/abcd", strict = TRUE)

## Clean up //
on.exit(options(".rapp" = opts_old))

}
