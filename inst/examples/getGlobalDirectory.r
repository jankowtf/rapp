\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setGlobalDirectory()
getGlobalDirectory() 

setGlobalDirectory(value = "test")
getGlobalDirectory()

## Clean up //
on.exit(options(".rapp" = opts_old))

}
