context("ensureInitialRappOptions-1")
test_that("ensureInitialRappOptions", {

  opts_old <- getOption(".rapp")
  
  expect_is(res <- ensureInitialRappOptions(), "environment")
  expect_equal(ls(res, all.names=TRUE), ".rte")
  expected <- sort(c(
    "runtime_mode",
    "repos_global",
    "repos_root",
    "repos_pkgs"
  ))
  expect_equal(ls(res$.rte, all.names=TRUE), expected)
  expected_values <- list(
    repos_global = NA_character_,
    repos_pkg = NA_character_,
    repos_root = NA_character_,
    runtime_mode = "dev"
  )
  expect_equivalent(
    res <- lapply(expected, get, envir = res$.rte),
    expected_values
  )
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
