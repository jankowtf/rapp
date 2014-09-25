context("initializeRappOptions-1")
test_that("initializeRappOptions", {

  opts_old <- getOption(".rapp")
  
  expect_is(res <- initializeRappOptions(), "environment")
  expect_equal(ls(res, all.names=TRUE), ".rte")
  expected <- sort(c(
    "runtime_mode",
    "repos_global",
    "repos_root",
    "repos_pkgs",
    "global_dir",
    "path_app"
  ))
  expect_equal(ls(res$.rte, all.names=TRUE), expected)
  expected_values <- list(
    path_app = getwd(),
    global_dir = file.path(Sys.getenv("HOME"), "rapp"),
    repos_global = NA_character_,
    repos_pkg = NA_character_,
    repos_root = NA_character_,
    runtime_mode = "dev"
  )
  expect_equivalent(
    res <- lapply(expected, get, envir = res$.rte),
    expected_values
  )
  expect_equal(getRappOption(".rte/global_dir"), 
               file.path(Sys.getenv("HOME"), "rapp"))
  expect_equal(getRappOption(".rte/path_app"), getwd())
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
