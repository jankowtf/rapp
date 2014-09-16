\dontrun{

## Save current option state //  
opts_old <- getOption(".rapp")

## Create example content //
ensureRappOptionsContainer(overwrite = TRUE)
setRappGlobal("q:/home/rapp")
setInternalRepositories()

processRepositoryData()
file.exists(gsub("file:///", "", getRappOption(".rte/repos_global")))
file.exists(gsub("file:///", "", getRappOption(".rte/repos_pkg")))

## Clean up //
on.exit(options(".rapp" = opts_old))

}
