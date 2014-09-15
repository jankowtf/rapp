\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Initialize options //
res <- ensureInitialRappOptions()
ls(res, all.names = TRUE)
ls(res$.rte, all.names = TRUE)

values <- lapply(expected, get, envir = res$.rte)
names(values) <- ls(res$.rte, all.names = TRUE)
values

## Clean up //
options(".rapp" = opts_old)

}
