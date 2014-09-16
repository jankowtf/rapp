context("hasRuntimeOptionFile-1")
test_that("hasRuntimeOptionFile", {

  if (basename(getwd()) == "testthat") {
    path_0 <- "data"
  } else{
    path_0 <- "tests/testthat/data"
  }
  
  if (!file.exists(file.path(path_0, "test"))) {
    package.skeleton(
      name = "test",
      path = path_0,
      force = TRUE
    )
    wd_0 <- setwd(file.path(path_0, "test"))
    ensureProjectComponents()
    setwd(wd_0)
  }
  
  expect_true(hasRuntimeOptionFile())
  expect_false(hasRuntimeOptionFile(path = "abcde"))
  expect_error(hasRuntimeOptionFile(path = "abcde", strict = TRUE))
  
  }
)
