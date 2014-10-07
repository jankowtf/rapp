context("unloadInternalRapp-A")
test_that("unloadInternalRapp", {
 
  opts_old <- getOption(".rapp")
  
  ## Create dummy package //
  path <- createPackageProject(id = "test.package", path = tempdir(),
                         overwrite = TRUE)
  path_pkg <- file.path(tempdir(), "test.package")
  
  ## Switch working directory //
  wd_0 <- setwd(path_pkg)
  ensureRappRuntime()
  wd_1 <- getwd()
  loadInternalRapp(id = "test")
  
  expect_true(unloadInternalRapp(id = "test"))
  expect_false(exists("test", envir = getRappOptions(strict = TRUE), 
                      inherits = FALSE))
  
  setwd(wd_0)
  on.exit({
    options(".rapp" = opts_old)
  })
  
  }
)
