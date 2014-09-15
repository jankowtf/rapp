\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Reset //
res <- resetRappOptions()
ls(res, all.names = TRUE)
ls(res$.rte, all.names = TRUE)

values <- lapply(expected, get, envir = res$.rte)
names(values) <- ls(res$.rte, all.names = TRUE)
values

## Clean up //
on.exit(options(".rapp" = opts_old))

}
