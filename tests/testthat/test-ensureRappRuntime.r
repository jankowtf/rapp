context("ensureRappRuntime-1")
test_that("ensureRappRuntime", {
 
  opts_old <- getOption(".rapp")
  
  if (basename(getwd()) == "testthat") {
    path_0 <- "data/test.package"
  } else {
    path_0 <- "tests/testthat/data/test.package"
  }

  ## Create dummy package //
  if (!isPackageProject(path = path_0)) {
    path <- createPackageProject(id = "test.package", path = dirname(path_0),
                         overwrite = TRUE)
  } else {
    path <- path_0
  }
  
  global_dir <- file.path(tempdir(), "rapp")
  ensureRappRuntime(
    path = path,
    global_dir = global_dir,
    runtime_mode = "dev"
  )

  expected <- c(".rte", "test.package")
  expect_equal(ls(getOption(".rapp"), all.names=TRUE), expected)
  
  expect_true(all(
    c("lib", "global_dir", "repos_dev_global", "repos_dev_pkg", "repos_dev_pkgs", 
      "repos_global", "repos_live_global", "repos_live_pkg", 
      "repos_live_pkgs", "repos_pkg", "repos_pkgs", "repos_root", 
      "repos_test_global", "repos_test_pkg", "repos_test_pkgs", 
      "runtime_mode") %in% 
      ls(getOption(".rapp")$.rte, all.names=TRUE)
  ))
  expect_true(all(
    c("ns", "global_dir") %in% 
      ls(getOption(".rapp")$test.package, all.names=TRUE)
  ))

  expect_equal(getRappOption(".rte/global_dir"), global_dir)
  
  on.exit({
    options(".rapp" = opts_old)
  })
  
  }
)
