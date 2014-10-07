\dontrun{

## Save current option state //  
opts_old <- getOption(".rapp")

mergeNsRappOptions(context = "test")
setNamespaceRappOption(ns = "test")

## Set an empty option container //
res <- getNsRappOption(ns = "test")
res
ls(res)
            
## Set context-specific options //
setNamespaceRappOption(ns = "test", id = "option_1", value = letters)            
res <- getNsRappOption(ns = "test")
ls(res)
getNsRappOption(ns = "test", id = "option_1")

setNamespaceRappOption(ns = "test", id = "option_group_1/option_1", 
   value = TRUE, branch_gap = TRUE)
res <- getNsRappOption(ns = "test")
ls(res)
ls(res$option_group_1)
getNsRappOption(ns = "test", id = "option_group_1/option_1")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
