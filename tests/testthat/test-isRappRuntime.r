context("isRappRuntime-1")
test_that("isRappRuntime", {

  opts_old <- getOption(".rapp")
  
  options(".rapp" = NULL)
  expect_false(isRappRuntime())
  initializeRappOptions()
  expect_true(isRappRuntime())
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
