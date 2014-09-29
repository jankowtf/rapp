context("ensureRoxygenTemplates-1")
test_that("ensureRoxygenTemplates", {
  
  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }

  path <- createPackageSkeleton(id = "test.package", path = tempdir(), 
    overwrite = TRUE)
  path 
  expect_is(res <- ensureRoxygenTemplates(path = path), "character")
  sapply(res, function(ii) {
    expect_true(file.exists(ii))
  })

  on.exit(.cleanTempDir(x = path))  

  }
)

