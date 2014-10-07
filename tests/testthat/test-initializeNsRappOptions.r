context("initializeNsRappOptions-1")
test_that("initializeNsRappOptions", {

  opts_old <- getOption(".rapp")
  
  ## Dummy package project //
  path <- file.path(tempdir(), "test")
  ns <- basename(path)
  createPackageSkeleton(id = "test", path = tempdir())
  wd_0 <- setwd(path)
  
  initializeRappOptions()
  expect_is(res <- initializeNsRappOptions(), "environment")
  expect_equal(ls(res, all.names=TRUE), c(".rte", ns))
  
  expected <- sort(c(
    "github_name",
    "is_internal",
    "ns",
    "global_dir"
  ))
  expect_equal(ls(res[[ns]], all.names=TRUE), expected)
  
  expected_values <- list(
    github_name = NA_character_,
    global_dir = NA_character_,
    is_internal = TRUE,
    ns = ns
  )
  expect_equivalent(
    lapply(expected, get, envir = res[[ns]]),
    expected_values
  )
  
  setwd(wd_0)
  on.exit({
    options(".rapp" = opts_old)
    filesystr::conditionalDelete(path, condition = tempdir())
  })
  
  }
)
