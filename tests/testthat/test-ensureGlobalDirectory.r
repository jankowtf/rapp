context("ensureGlobalDirectory-1")
test_that("ensureGlobalDirectory", {

  opts_old <- getOption(".rapp")
  
  initializeRappOptions()
  setGlobalDirectory("q:/home/rapp")
  expect_true(res <- ensureGlobalDirectory())
  expect_true("global_dir" %in% ls(getOption(".rapp")$.rte, all.names=TRUE))
  
  expect_true(file.exists(file.path(getGlobalDirectory(), "ns")))
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
