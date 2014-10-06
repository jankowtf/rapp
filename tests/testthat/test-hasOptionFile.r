context("hasOptionFile-1")
test_that("hasOptionFile", {

  if (basename(getwd()) == "testthat") {
    path_0 <- "data"
  } else{
    path_0 <- "tests/testthat/data"
  }
  
  if (!file.exists(file.path(path_0, "test.package"))) {
    suppressMessages(package.skeleton(
      name = "test",
      path = path_0,
      force = TRUE
    ))
    wd_0 <- setwd(file.path(path_0, "test.package"))
    ensureProjectComponents()
    setwd(wd_0)
  }
  
  wd_0 <- setwd(file.path(path_0, "test.package"))
  expect_true(hasOptionFile())
  expect_false(hasOptionFile(path = "abcde"))
  expect_error(hasOptionFile(path = "abcde", strict = TRUE))
  
  setwd(wd_0)
  
  }
)
