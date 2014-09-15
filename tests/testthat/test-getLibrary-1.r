context("getLibrary-1")
test_that("getLibrary", {

  opts_old <- getOption(".rapp")
  
  setLibrary(value = tempdir())
  expect_equal(res <- getLibrary(), tempdir())
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
