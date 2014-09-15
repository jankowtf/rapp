\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setRuntimeStage()
getRuntimeStage()
setRuntimeStage(value = "test")
getRuntimeStage()
setRuntimeStage(value = "live")
getRuntimeStage()

try(setRuntimeStage(value = "abcd"))

## Clean up //    
on.exit(options(".rapp" = opts_old))

}
