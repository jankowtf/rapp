context("setRuntimeStage-1")
test_that("setRuntimeStage", {

  opts_old <- getOption(".rapp")
  
  expect_true(res <- setRuntimeStage())
  expect_equal(getRappOption(".rte/runtime_stage"), "dev")
  expect_true(res <- setRuntimeStage(value = "test"))
  expect_equal(getRappOption(".rte/runtime_stage"), "test")
  expect_true(res <- setRuntimeStage(value = "live"))
  expect_equal(getRappOption(".rte/runtime_stage"), "live")
  
  expect_error(setRuntimeStage(value = "abcd"))
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
