\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Set //
setGlobalDirectory()
getRappOption(".rte/global_dir") 
  
setGlobalDirectory(value = "test")
getRappOption(".rte/global_dir")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
