\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setRappGlobal()
getRappGlobal() 

setRappGlobal(value = "test")
getRappGlobal()

## Clean up //
on.exit(options(".rapp" = opts_old))

}
