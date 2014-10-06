context("setGlobalDirectory-1")
test_that("setGlobalDirectory", {

  opts_old <- getOption(".rapp")
  
  expect_true(res <- setGlobalDirectory())
  expect_equal(getRappOption(".rte/global_dir"), 
    file.path(Sys.getenv("HOME"), "rapp"))
  expect_true(res <- setGlobalDirectory(value = "test"))
  expect_equal(getRappOption(".rte/global_dir"), "test")
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
