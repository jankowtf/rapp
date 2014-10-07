context("mergeNsRappOptions-1")
test_that("mergeNsRappOptions", {

  opts_old <- getOption(".rapp")
  
  initializeRappOptions()
  ## If reactive //
  if (FALSE) {
    setGlobalDirectory(tempdir())
  }
  expect_is(res <- mergeNsRappOptions(), "logical")
#   expect_equal(ls(getOption(".rapp"), all.names=TRUE), c(".rte", "rapp"))
#   expect_true(all(c("ns", "global_dir") %in% 
#         ls(getOption(".rapp")$rapp, all.names=TRUE)))
#   
  on.exit(options(".rapp" = opts_old))
  
  }
)
