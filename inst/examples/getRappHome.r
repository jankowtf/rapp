\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setRappHome()
getRappHome() 

setRappHome(value = "test")
getRappHome()

## Clean up //
on.exit(options(".rapp" = opts_old))

}
