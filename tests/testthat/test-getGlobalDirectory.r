context("getGlobalDirectory-1")
test_that("getGlobalDirectory", {

  opts_old <- getOption(".rapp")
  
  setGlobalDirectory(value = tempdir())
  expect_equal(res <- getGlobalDirectory(), tempdir())
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
