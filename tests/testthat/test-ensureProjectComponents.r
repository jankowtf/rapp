context("ensureProjectComponents-1")
test_that("ensureProjectComponents", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  suppressMessages(createPackageSkeleton(
    id = "test.package",
    path = tempdir(),
    overwrite = TRUE
  ))
  
  path <- file.path(tempdir(), "test.package")
  wd_0 <- setwd(path)
  expect_true(res <- ensureProjectComponents())
  expect_true(file.exists("data"))
  expect_true(file.exists("man"))
  expect_true(file.exists("R/test.package.r"))
  expect_true(file.exists("DESCRIPTION"))
  expect_true(file.exists("NAMESPACE"))
  
  expect_true(res <- ensureProjectComponents(overwrite = TRUE))
  
  setwd(wd_0)
  on.exit({
    .cleanTempDir(x = path)
  })
  
  }
)
