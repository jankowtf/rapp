context("setInternalRepositories-1")
test_that("setInternalRepositories", {

  opts_old <- getOption(".rapp")
  
  setRappHome("q:/home/rapp")
  expect_is(res <- setInternalRepositories(), "logical")
  expect_true(all(c("repos_root", "repos_dev_global", "repos_test_global", 
    "repos_live_global", "repos_dev_pkgs", "repos_test_pkgs", "repos_live_pkgs",
    "repos_global") 
    %in% 
    ls(getOption(".rapp")$.rte, all.names=TRUE))
  )
  expect_is(res <- setInternalRepositories(pkg = "test", vsn = "1.0"), "logical")
  expect_true(all(c("repos_dev_pkg", "repos_test_pkg", "repos_live_pkg", 
                    "repos_pkg") 
    %in% 
    ls(getOption(".rapp")$.rte, all.names=TRUE))
  )
  expect_equal(basename(getRappOption(".rte/repos_dev_pkg")), "1.0")
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
