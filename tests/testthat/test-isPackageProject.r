context("isPackageProject-1")
test_that("isPackageProject", {

  if (basename(getwd()) == "testthat") {
    path_0 <- "data"
  } else{
    path_0 <- "tests/testthat/data"
  }
  path <- file.path(path_0, c("package_valid", paste0("package_invalid_", 1:4)))
  
  expect_equivalent(
    sapply(path, isPackageProject),
    c(TRUE, rep(FALSE, 4))
  )
  sapply(path[2:5], function(ii) {
    expect_error(isPackageProject(path = ii, strict = TRUE))
  })
  
  }
)
