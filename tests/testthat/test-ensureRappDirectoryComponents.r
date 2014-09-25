context("ensureRappComponents-1")
test_that("ensureRappComponents", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  suppressMessages(package.skeleton(
    name = "test",
    path = tempdir(),
    force = TRUE
  ))
  path <- file.path(tempdir(), "test")
  wd_0 <- setwd(path)
  expect_true(res <- ensureRappComponents())
  expect_true(file.exists("options/options_rapp.r"))
  expect_true(file.exists("options/options_runtime.r"))
  expect_true(res <- ensureRappComponents(overwrite = TRUE))
  
  setwd(wd_0)
  on.exit({
    .cleanTempDir(x = path)
  })
  
  }
)
