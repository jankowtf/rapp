context("mergeNamespaceRappOptions-1")
test_that("mergeNamespaceRappOptions", {

  opts_old <- getOption(".rapp")
  
  initializeRappOptions()
  ## If reactive //
  if (FALSE) {
    setGlobalDirectory(tempdir())
  }
  expect_is(res <- mergeNamespaceRappOptions(), "logical")
#   expect_equal(ls(getOption(".rapp"), all.names=TRUE), c(".rte", "rapptime"))
#   expect_true(all(c("ns", "global_dir") %in% 
#         ls(getOption(".rapp")$rapptime, all.names=TRUE)))
#   
  on.exit(options(".rapp" = opts_old))
  
  }
)
