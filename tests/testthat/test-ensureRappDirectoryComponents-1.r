context("ensureRappDirectoryComponents-1")
test_that("ensureRappDirectoryComponents", {

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
  expect_true(res <- ensureRappDirectoryComponents())
  expect_true(file.exists("rapp/options/options.r"))
  expect_true(file.exists("rapp/options/options_runtime.r"))
  expect_true(res <- ensureRappDirectoryComponents(overwrite = TRUE))
  
  setwd(wd_0)
  on.exit({
    .cleanTempDir(x = path)
  })
  
  }
)
