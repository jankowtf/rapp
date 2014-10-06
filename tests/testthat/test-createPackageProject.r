context("createPackageProject-1")
test_that("createPackageProject", {
  
  skip("interactive only")
  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }

  expect_equal(path <- createPackageProject(id = "test.package", 
    path = tempdir(), overwrite = TRUE), 
    file.path(tempdir(), "test.package")
  )
  expect_true(file.exists(file.path(path, "apps/test/DESCRIPTION")))
  expect_true(file.exists(file.path(path, "data")))
  expect_true(file.exists(file.path(path, "inst/examples")))
  expect_true(file.exists(file.path(path, "man")))
  expect_true(file.exists(file.path(path, "man-roxygen")))
  expect_true(file.exists(file.path(path, "options/options_ns.r")))
  expect_true(file.exists(file.path(path, "options/options_runtime.r")))
  expect_true(file.exists(file.path(path, "R/test.package.r")))
  expect_true(file.exists(file.path(path, "tests/testthat/data")))
  expect_true(file.exists(file.path(path, "vignettes")))
  expect_true(file.exists(file.path(path, "DESCRIPTION")))
  expect_true(file.exists(file.path(path, "NAMESPACE")))
  
  on.exit(.cleanTempDir(x = file.path(tempdir(), "test.package")))  

  }
)

