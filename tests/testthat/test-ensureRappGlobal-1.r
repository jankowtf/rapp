context("ensureRappGlobal-1")
test_that("ensureRappGlobal", {

  opts_old <- getOption(".rapp")
  
  ensureInitialRappOptions()
  setRappGlobal("q:/home/rapp")
  expect_true(res <- ensureRappGlobal())
  expect_true("rapp_global" %in% ls(getOption(".rapp")$.rte, all.names=TRUE))
  
  expect_true(file.exists(file.path(getRappGlobal(), "ns")))
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
