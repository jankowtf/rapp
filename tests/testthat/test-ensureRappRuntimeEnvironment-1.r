context("ensureNamespaceRappOptions-1")
test_that("ensureNamespaceRappOptions", {

  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  } else {
    is_testthat <- FALSE
  }
  
  opts_old <- getOption(".rapp")
  
  ensureInitialRappOptions()
  
  ensureRappRuntimeEnvironment(
    rapp_home = "q:/home/rapp",
    runtime_mode = "dev"
  )
#   print(ls(getOption(".rapp"), all.names=TRUE))
#   ls(getOption(".rapp")$.rte, all.names=TRUE)
  if (is_testthat) {
    expected <- ".rte"
  } else {
    expected <- c(".rte", "rapp.core.rte")
  }
  expect_equal(ls(getOption(".rapp"), all.names=TRUE), expected)
  
  expect_true(all(
    c("lib", "rapp_home", "repos_dev_global", "repos_dev_pkg", "repos_dev_pkgs", 
      "repos_global", "repos_live_global", "repos_live_pkg", 
      "repos_live_pkgs", "repos_pkg", "repos_pkgs", "repos_root", 
      "repos_test_global", "repos_test_pkg", "repos_test_pkgs", 
      "runtime_mode") %in% 
      ls(getOption(".rapp")$.rte, all.names=TRUE)))
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
