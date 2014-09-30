context("setNamespaceRappOption-1")
test_that("setNamespaceRappOption", {

  opts_old <- getOption(".rapp")
  
  expect_true(setNamespaceRappOption(ns = "test"))
  expect_is(getRappOption("test"), "environment")
  expect_true(setNamespaceRappOption(ns = "test", id = "option_1", 
    value = letters))
  expect_equal(getRappOption("test/option_1"), letters)
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
