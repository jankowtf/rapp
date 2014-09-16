context("readRuntimeOptionFile-1")
test_that("readRuntimeOptionFile", {

  if (basename(getwd()) == "testthat") {
    path_0 <- "data"
  } else{
    path_0 <- "tests/testthat/data"
  }
  
  wd_0 <- setwd(file.path(path_0, "test"))
  expect_is(res <- readRuntimeOptionFile(), "list")
  expect_true(length(res) > 0)
  expect_is(res <- readRuntimeOptionFile(path = "abcde"), "list")
  expect_true(length(res) == 0)
  expect_error(readRuntimeOptionFile(path = "abcde", strict = TRUE))
  
  setwd(wd_0)
  
  }
)
