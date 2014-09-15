context("getRuntimeStage-1")
test_that("getRuntimeStage", {

  opts_old <- getOption(".rapp")
  
  setRuntimeStage(value = "dev")
  expect_equal(res <- getRuntimeStage(), "dev")
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
