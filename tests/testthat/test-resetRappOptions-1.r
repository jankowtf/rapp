context("resetRappOptions-1")
test_that("resetRappOptions", {

  opts_old <- getOption(".rapp")
  
  expect_is(res <- resetRappOptions(), "environment")
  expect_equivalent(res, ensureInitialRappOptions())
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
