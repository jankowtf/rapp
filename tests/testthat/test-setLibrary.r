context("setLibrary-1")
test_that("setLibrary", {

  opts_old <- getOption(".rapp")
  
  expect_true(res <- setLibrary())
  expect_equal(getRappOption(".rte/lib"), .libPaths()[1])
  expect_true(res <- setLibrary(value = tempdir()))
  expect_equal(getRappOption(".rte/lib"), tempdir())
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
