\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setRappHome()
getRappOption(".rte/rapp_home") 
  
setRappHome(value = "test")
getRappOption(".rte/rapp_home")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
