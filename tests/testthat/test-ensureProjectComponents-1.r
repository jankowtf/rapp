context("ensureProjectComponents-1")
test_that("ensureProjectComponents", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  package.skeleton(
    name = "test",
    path = tempdir(),
    force = TRUE
  )
  path <- file.path(tempdir(), "test")
  wd_0 <- setwd(path)
  expect_true(res <- ensureProjectComponents())
  expect_true(file.exists("data"))
  expect_true(file.exists("man-roxygen"))
  expect_true(file.exists("inst/examples"))
  expect_true(file.exists("rapp/apps/test/options"))
  expect_true(file.exists("rapp/apps/test/R"))
  expect_true(file.exists("rapp/options"))
  expect_true(file.exists("tests/testthat/data"))
  expect_true(file.exists("vignettes"))
  
  setwd(wd_0)
  on.exit({
    .cleanTempDir(x = path)
  })
  
  }
)
