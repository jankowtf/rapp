context("ensureNamespaceRappOptions-1")
test_that("ensureNamespaceRappOptions", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  if (basename(getwd()) == "testthat") {
    is_testthat <- TRUE
  } else {
    is_testthat <- FALSE
  }
  
  opts_old <- getOption(".rapp")
  
  ## Create dummy package //
  path <- file.path(tempdir(), "test")
  package.skeleton(
    name = basename(path),
    path = dirname(path),
    force = TRUE
  )
  
  wd_0 <- setwd(path)
  
  initializeRappOptions()
  
  rapp_global <- file.path(tempdir(), "home")
  ensureRuntimeEnvironment(
    rapp_global = rapp_global,
    runtime_mode = "dev"
  )
#   print(ls(getOption(".rapp"), all.names=TRUE))
#   ls(getOption(".rapp")$test, all.names=TRUE)
#   if (is_testthat) {
#     expected <- ".rte"
#   } else {
    expected <- c(".rte", "test")
#   }
  expect_equal(ls(getOption(".rapp"), all.names=TRUE), expected)
  
  expect_true(all(
    c("lib", "rapp_global", "repos_dev_global", "repos_dev_pkg", "repos_dev_pkgs", 
      "repos_global", "repos_live_global", "repos_live_pkg", 
      "repos_live_pkgs", "repos_pkg", "repos_pkgs", "repos_root", 
      "repos_test_global", "repos_test_pkg", "repos_test_pkgs", 
      "runtime_mode") %in% 
      ls(getOption(".rapp")$.rte, all.names=TRUE)
  ))
  expect_true(all(
    c("ns", "ns_global") %in% 
      ls(getOption(".rapp")$test, all.names=TRUE)
  ))

  setwd(wd_0)
  on.exit({
    options(".rapp" = opts_old)
    .cleanTempDir(x = path)
  })
  
  }
)
