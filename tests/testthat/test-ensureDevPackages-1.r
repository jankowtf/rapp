context("ensureDevPackages-1")
test_that("ensureDevPackages", {

  opts_old <- getOption(".rapp")
  
  setRappHome("q:/home/rapp")
  setRuntimeStage("dev")
  setLibrary(.libPaths()[1])
  expect_is(res <- ensureDevPackages(), "logical")
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
