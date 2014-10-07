context("initializeNsOptions-A")
test_that("initializeNsOptions", {
  
  skip("Interactive only")
#   expect_is(res <- initializeNsOptions(), "environment")
#   expect_equal(ls(res, all.names=TRUE), ".rte")
#   expected <- sort(c(
#     "runtime_mode",
#     "repos_global",
#     "repos_root",
#     "repos_pkgs",
#     "global_dir",
#     "ns_prime",
#     "wd_prime"
#   ))
#   expect_equal(ls(res$.rte, all.names=TRUE), expected)
#   expected_values <- list(
#     global_dir = file.path(Sys.getenv("HOME"), "rapp"),
#     ns_prime = "rapp",
#     repos_global = NA_character_,
#     repos_pkg = NA_character_,
#     repos_root = NA_character_,
#     runtime_mode = "dev",
#     wd_prime = getwd()
#   )
#   expect_equivalent(
#     res <- lapply(expected, get, envir = res$.rte),
#     expected_values
#   )
#   expect_equal(getRappOption(".rte/global_dir"), 
#                file.path(Sys.getenv("HOME"), "rapp"))
#   
#   on.exit(options(".rapp" = opts_old))
  
  }
)
