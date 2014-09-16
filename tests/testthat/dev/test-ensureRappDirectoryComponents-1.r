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
  wd_0 <- setwd(file.path(tempdir(), "test"))
  expect_true(res <- ensureRappDirectoryComponents())
  
  on.exit({
    setwd(wd_0)
    .cleanTempDir(x = tempdir())
  })
  
  }
)
