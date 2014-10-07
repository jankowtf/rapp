context("loadInternalRapp-1")
test_that("loadInternalRapp", {
 
  opts_old <- getOption(".rapp")
  
  ## Create dummy package //
  path <- createPackageProject(id = "test.package", path = tempdir(),
                         overwrite = TRUE)
  path_pkg <- file.path(tempdir(), "test.package")
  
  ## Switch working directory //
  wd_0 <- setwd(path_pkg)
  ensureRappRuntime()
  wd_1 <- getwd()
  
  expect_true(loadInternalRapp(id = "test"))
  expect_true(loadInternalRapp(id = "test"))
  expect_error(loadInternalRapp(id = "test", strict = TRUE))
  
  ## Internal options that should not be changed //
  expect_equal(getRappOption(".rte/ns_prime"), "test.package")
  expect_equal(getRappOption(".rte/wd_prime"), wd_1)
  
  expect_equal(sort(ls(getOption(".rapp"), all.names = TRUE)),
              sort(c(".rte", "test", "test.package")))
  expect_equal(getNsRappOption(id = "global_dir"),
    file.path(getRappOption(".rte/global_dir"), "ns/test.package/test")
  )
  if (FALSE) {
  ## Interactive only //    
    filesystr::openRessource(tempdir())
    expect_equal(getNsRappOption(id = "test_option"), "hello world")
    expect_equal(getNsRappOption(id = "test_option_2"), TRUE)
  }
  
  ## Unload //
  unloadInternalRapp(id = "test")
  
  setwd(wd_0)
  on.exit({
    options(".rapp" = opts_old)
  })
  
  }
)
