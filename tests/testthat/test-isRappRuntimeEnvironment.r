context("isRappRuntimeEnvironment-1")
test_that("isRappRuntimeEnvironment", {

  opts_old <- getOption(".rapp")
  
  options(".rapp" = NULL)
  expect_false(isRappRuntimeEnvironment())
  initializeRappOptions()
  expect_true(isRappRuntimeEnvironment())
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
