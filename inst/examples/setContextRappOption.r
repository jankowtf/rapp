\dontrun{

## Save current options state //  
opts_old <- getOption(".rapp")

## Set option container //
setContextRappOption(ctx = "test")
getContextRappOption(ctx = "test")

## Set context-specific option //
setContextRappOption(ctx = "test", id = "option_1", value = letters)
getContextRappOption(ctx = "test", id = "option_1")

setContextRappOption(ctx = "test", id = "option_group_1/option_1", 
   value = TRUE, branch_gap = TRUE)
getContextRappOption(ctx = "test", id = "option_group_1/option_1")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
