context("setNsRappOption-1")
test_that("setNsRappOption", {

  opts_old <- getOption(".rapp")
  
  expect_true(setNsRappOption(ns = "test"))
  expect_is(getRappOption("test"), "environment")
  expect_true(setNsRappOption(ns = "test", id = "option_1", 
    value = letters))
  expect_equal(getRappOption("test/option_1"), letters)
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
