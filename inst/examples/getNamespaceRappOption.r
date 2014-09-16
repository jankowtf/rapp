\dontrun{

## Save current option state //  
opts_old <- getOption(".rapp")

ensureNamespaceRappOptions(context = "test")
setNamespaceRappOption(ns = "test")

## Set an empty option container //
res <- getNamespaceRappOption(ns = "test")
res
ls(res)
            
## Set context-specific options //
setNamespaceRappOption(ns = "test", id = "option_1", value = letters)            
res <- getNamespaceRappOption(ns = "test")
ls(res)
getNamespaceRappOption(ns = "test", id = "option_1")

setNamespaceRappOption(ns = "test", id = "option_group_1/option_1", 
   value = TRUE, branch_gap = TRUE)
res <- getNamespaceRappOption(ns = "test")
ls(res)
ls(res$option_group_1)
getNamespaceRappOption(ns = "test", id = "option_group_1/option_1")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
