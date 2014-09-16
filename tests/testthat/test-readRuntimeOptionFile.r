context("readRuntimeOptionFile-1")
test_that("readRuntimeOptionFile", {

  expect_is(res <- readRuntimeOptionFile(), "list")
  expect_true(length(res) > 0)
  expect_is(res <- readRuntimeOptionFile(path = "abcde"), "list")
  expect_true(length(res) == 0)
  expect_error(readRuntimeOptionFile(path = "abcde", strict = TRUE))
  
  }
)
