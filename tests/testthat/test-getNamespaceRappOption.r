context("getNamespaceRappOption-1")
test_that("getNamespaceRappOption", {

  skip("not finished yet")
  opts_old <- getOption(".rapp")
  
  if (basename(getwd()) == "testthat") {
    wd_0 <- setwd("data/test")
  } else {
    wd_0 <- setwd("tests/testthat/data/test")
  }
  
  initializeRappOptions()
  initializeNamespaceRappOptions()
#   ls(getOption(".rapp"))
  setGlobalDirectory(tempdir())
  
  mergeNamespaceRappOptions(ns = "test")
  setNamespaceRappOption(ns = "test")
  expect_is(res <- getNamespaceRappOption(ns = "test"), "environment")
  expect_true(!length(ls(res)))
              
  setNamespaceRappOption(ns = "test", id = "option_1", value = letters)            
  expect_is(res <- getNamespaceRappOption(ns = "test"), "environment")
  expect_true("option_1" %in% ls(res))
  expect_equal(res <- getNamespaceRappOption(ns = "test", id = "option_1"), letters)
  
  setwd(wd_0)
  on.exit(options(".rapp" = opts_old))
  
  }
)

