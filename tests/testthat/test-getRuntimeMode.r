context("getRuntimeMode-1")
test_that("getRuntimeMode", {

  opts_old <- getOption(".rapp")
  
  setRuntimeMode(value = "dev")
  expect_equal(res <- getRuntimeMode(), "dev")
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
