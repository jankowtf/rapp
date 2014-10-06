context("createPackageSkeleton-1")
test_that("createPackageSkeleton", {
  
  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }

  expect_equal(res <- createPackageSkeleton(id = "test.package", 
    path = tempdir(), overwrite = TRUE), 
    file.path(tempdir(), "test.package"))
  expect_true(file.exists(file.path(res, "data")))
  expect_true(file.exists(file.path(res, "man")))
  expect_true(file.exists(file.path(res, "R/test.package.r")))
  expect_true(file.exists(file.path(res, "DESCRIPTION")))
  expect_true(file.exists(file.path(res, "NAMESPACE")))
  
  on.exit(.cleanTempDir(x = file.path(tempdir(), "test.package")))  

  }
)

