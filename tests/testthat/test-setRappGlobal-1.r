context("setRappGlobal-1")
test_that("setRappGlobal", {

  opts_old <- getOption(".rapp")
  
  expect_true(res <- setRappGlobal())
  expect_equal(getRappOption(".rte/rapp_global"), 
    file.path(Sys.getenv("HOME"), "rapp"))
  expect_true(res <- setRappGlobal(value = "test"))
  expect_equal(getRappOption(".rte/rapp_global"), "test")
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
