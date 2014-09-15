context("getContextRappOption-1")
test_that("getContextRappOption", {

  opts_old <- getOption(".rapp")
  
  ensureContextRappOptions(ctx = "test")
  setContextRappOption(ctx = "test")
  expect_is(res <- getContextRappOption(ctx = "test"), "environment")
  expect_true(!length(ls(res)))
              
  setContextRappOption(ctx = "test", id = "option_1", value = letters)            
  expect_is(res <- getContextRappOption(ctx = "test"), "environment")
  expect_true("option_1" %in% ls(res))
  expect_equal(res <- getContextRappOption(ctx = "test", id = "option_1"), letters)
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
