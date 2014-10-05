context("ensureRappComponents-1")
test_that("ensureRappComponents", {

  createPackageSkeleton(id = "test", path = tempdir())
  path <- file.path(tempdir(), "test")
  wd_0 <- setwd(path)
  expect_true(res <- ensureRappComponents())
  expect_true(file.exists("options/options_ns.r"))
  expect_true(file.exists("options/options_runtime.r"))
  expect_true(res <- ensureRappComponents(overwrite = TRUE))
  
  setwd(wd_0)
  on.exit({
    filesystr::conditionalDelete(path, condition = tempdir())
  })
  
  }
)
