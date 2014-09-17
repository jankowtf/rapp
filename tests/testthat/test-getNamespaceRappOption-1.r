context("getNamespaceRappOption-1")
test_that("getNamespaceRappOption", {

  opts_old <- getOption(".rapp")
  
  initializeRappOptions()
  setRappGlobal(tempdir())
  ensureNamespaceRappOptions(ns = "test")
  setNamespaceRappOption(ns = "test")
  expect_is(res <- getNamespaceRappOption(ns = "test"), "environment")
  expect_true(!length(ls(res)))
              
  setNamespaceRappOption(ns = "test", id = "option_1", value = letters)            
  expect_is(res <- getNamespaceRappOption(ns = "test"), "environment")
  expect_true("option_1" %in% ls(res))
  expect_equal(res <- getNamespaceRappOption(ns = "test", id = "option_1"), letters)
  
  on.exit(options(".rapp" = opts_old))
  
  }
)

