\dontrun{

## Save current option state //  
opts_old <- getOption(".rapp")

ensureContextRappOptions(context = "test")
setContextRappOption(ctx = "test")

## Set an empty option container //
res <- getContextRappOption(ctx = "test")
res
ls(res)
            
## Set context-specific options //
setContextRappOption(ctx = "test", id = "option_1", value = letters)            
res <- getContextRappOption(ctx = "test")
ls(res)
getContextRappOption(ctx = "test", id = "option_1")

setContextRappOption(ctx = "test", id = "option_group_1/option_1", 
   value = TRUE, branch_gap = TRUE)
res <- getContextRappOption(ctx = "test")
ls(res)
ls(res$option_group_1)
getContextRappOption(ctx = "test", id = "option_group_1/option_1")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
