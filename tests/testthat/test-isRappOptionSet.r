context("isRappOptionSet-1")
test_that("isRappOptionSet", {

  opts_old <- getOption(".rapp")
  
  ## Create example content //
  container <- initializeRappOptions()
  cont_this <- getRappOption(id = ".rte")
  setRappOption(
    id = ".rte/is_set",
    value = TRUE
  )
  cont_sub <- setRappOption(
    id = ".rte/is_not_set_1",
    value = NA
  )
  cont_sub <- setRappOption(
    id = ".rte/is_not_set_2",
    value = character()
  )
  
  expect_true(res <- isRappOptionSet(id = ".rte/is_set"))
  expect_true(res <- isRappOptionSet(id = ".rte/runtime_mode"))
  expect_false(res <- isRappOptionSet(id = ".rte/is_not_set_1"))
  expect_false(res <- isRappOptionSet(id = ".rte/is_not_set_2"))
  
  cont_sub <- setRappOption(
    id = ".rte/is_not_set_1",
    value = list(a = 1)
  )
  expect_true(res <- isRappOptionSet(id = ".rte/is_not_set_1"))  
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
