context("mergeNamespaceRappOptions-1")
test_that("mergeNamespaceRappOptions", {

  opts_old <- getOption(".rapp")
  
  initializeRappOptions()
  setRappGlobal(tempdir())
  expect_is(res <- mergeNamespaceRappOptions(), "logical")
  expect_equal(ls(getOption(".rapp"), all.names=TRUE), c(".rte", "rapp.core.rte"))
  expect_true(all(c("ns", "ns_global") %in% 
        ls(getOption(".rapp")$rapp.core.rte, all.names=TRUE)))
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
