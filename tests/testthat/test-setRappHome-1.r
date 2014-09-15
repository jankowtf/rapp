context("setRappHome-1")
test_that("setRappHome", {

  opts_old <- getOption(".rapp")
  
  expect_true(res <- setRappHome())
  expect_equal(getRappOption(".rte/rapp_home"), 
    file.path(Sys.getenv("HOME"), "rapp"))
  expect_true(res <- setRappHome(value = "test"))
  expect_equal(getRappOption(".rte/rapp_home"), "test")
               
  on.exit(options(".rapp" = opts_old))
  
  }
)
