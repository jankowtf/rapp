\dontrun{

## Save current options state //
opts_old <- getOption(".rapp")

## Create example content //
container <- resetRappOptions()
cont_this <- getRappOption(id = ".rte")
setRappOption(
  id = ".rte/is_set",
  value = TRUE
)
setRappOption(
  id = ".rte/is_not_set_1",
  value = NA
)
setRappOption(
  id = ".rte/is_not_set_2",
  value = character()
)

isRappOptionSet(id = ".rte/is_set")
isRappOptionSet(id = ".rte/runtime_mode")
isRappOptionSet(id = ".rte/is_not_set_1")
isRappOptionSet(id = ".rte/is_not_set_2")

setRappOption(
  id = ".rte/is_not_set_1",
  value = list(a = 1)
)
isRappOptionSet(id = ".rte/is_not_set_1")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
