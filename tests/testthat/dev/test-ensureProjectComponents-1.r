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
  wd_0 <- setwd(file.path(tempdir(), "test"))
  expect_true(res <- ensureProjectComponents())
  setwd(wd_0)
  
  on.exit({
    setwd(wd_0)
    .cleanTempDir(x = tempdir())
  })
  
  }
)
