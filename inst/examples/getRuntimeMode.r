\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setRuntimeMode()
getRuntimeMode()
setRuntimeMode(value = "test")
getRuntimeMode()
setRuntimeMode(value = "live")
getRuntimeMode()

try(setRuntimeMode(value = "abcd"))

## Clean up //    
on.exit(options(".rapp" = opts_old))

}
