context("getRappHome-1")
test_that("getRappHome", {

  opts_old <- getOption(".rapp")
  
  setRappHome(value = tempdir())
  expect_equal(res <- getRappHome(), tempdir())
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
