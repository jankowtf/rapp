context("mergeNamespaceRappOptions-1")
test_that("mergeNamespaceRappOptions", {

  skip()
  opts_old <- getOption(".rapp")
  
  initializeRappOptions()
  setGlobalDirectory(tempdir())
  expect_is(res <- mergeNamespaceRappOptions(), "logical")
#   expect_equal(ls(getOption(".rapp"), all.names=TRUE), c(".rte", "runtimr"))
#   expect_true(all(c("ns", "ns_global") %in% 
#         ls(getOption(".rapp")$runtimr, all.names=TRUE)))
#   
  on.exit(options(".rapp" = opts_old))
  
  }
)
