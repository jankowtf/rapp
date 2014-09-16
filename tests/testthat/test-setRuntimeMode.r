context("setRuntimeMode-1")
test_that("setRuntimeMode", {

  opts_old <- getOption(".rapp")
  
  expect_true(res <- setRuntimeMode())
  expect_equal(getRappOption(".rte/runtime_mode"), "dev")
  expect_true(res <- setRuntimeMode(value = "test"))
  expect_equal(getRappOption(".rte/runtime_mode"), "test")
  expect_true(res <- setRuntimeMode(value = "live"))
  expect_equal(getRappOption(".rte/runtime_mode"), "live")
  
  expect_error(setRuntimeMode(value = "abcd"))
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
