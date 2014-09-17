context("readRappOptionFile-1")
test_that("readRappOptionFile", {

  if (basename(getwd()) == "testthat") {
    path_0 <- "data"
  } else{
    path_0 <- "tests/testthat/data"
  }
  
  wd_0 <- setwd(file.path(path_0, "test"))
  expect_is(res <- readRappOptionFile(), "list")
  expect_true(length(res) > 0)
  expect_is(res <- readRappOptionFile(path = "abcde"), "list")
  expect_true(length(res) == 0)
  expect_error(readRappOptionFile(path = "abcde", strict = TRUE))
  
  setwd(wd_0)
  
  }
)
