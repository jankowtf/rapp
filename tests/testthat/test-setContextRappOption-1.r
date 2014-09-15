context("setContextRappOption-1")
test_that("setContextRappOption", {

  opts_old <- getOption(".rapp")
  
  expect_true(setContextRappOption(ctx = "test"))
  expect_is(getRappOption("test"), "environment")
  expect_true(setContextRappOption(ctx = "test", id = "option_1", value = letters))
  expect_equal(getRappOption("test/option_1"), letters)
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
