\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setLibrary(value = tempdir())
getLibrary()

## Clean up //    
on.exit(options(".rapp" = opts_old))

}
