context("getRappGlobal-1")
test_that("getRappGlobal", {

  opts_old <- getOption(".rapp")
  
  setRappGlobal(value = tempdir())
  expect_equal(res <- getRappGlobal(), tempdir())
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
