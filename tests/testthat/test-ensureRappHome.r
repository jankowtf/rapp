context("ensureRappHome-1")
test_that("ensureRappHome", {

  opts_old <- getOption(".rapp")
  
  ensureInitialRappOptions()
  setRappHome("q:/home/rapp")
  expect_true(res <- ensureRappHome())
  expect_true("rapp_home" %in% ls(getOption(".rapp")$.rte, all.names=TRUE))
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
