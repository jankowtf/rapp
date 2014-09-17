\dontrun{

## Save current option state //  
opts_old <- getOption(".rapp")

## Create example content //
resetRappOptions()
getRappOption(id = ".rte")

## Set and get values //
setRappOption(id = ".rte/test", value = TRUE)
getRappOption(id = ".rte/test")
getRappOption(id = ".rte/abcd")
getRappOption(id = ".rte/abcd", strict = TRUE)

## Numerical names //
setRappOption(id = "20140101", value = "hello world!")
getRappOption(id = "20140101")

## Clean up //
options(".rapp" = opts_old)

}
