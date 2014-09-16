context("ensureNamespaceRappOptions-1")
test_that("ensureNamespaceRappOptions", {

  opts_old <- getOption(".rapp")
  
  ensureInitialRappOptions()
  setRappHome(tempdir())
  expect_is(res <- ensureNamespaceRappOptions(), "logical")
  expect_equal(ls(getOption(".rapp"), all.names=TRUE), c(".rte", "rapp.core.rte"))
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
