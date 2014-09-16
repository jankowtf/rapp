\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setRappGlobal()
getRappOption(".rte/rapp_global") 
  
setRappGlobal(value = "test")
getRappOption(".rte/rapp_global")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
