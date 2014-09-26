context("initializeNamespaceRappOptions-1")
test_that("initializeNamespaceRappOptions", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  opts_old <- getOption(".rapp")
  
  ## Dummy package project //
  path <- file.path(tempdir(), "test")
  ns <- basename(path)
  suppressMessages(package.skeleton(
    name = ns,
    path = dirname(path),
    force = TRUE
  ))
  wd_0 <- setwd(path)
  
  initializeRappOptions()
  expect_is(res <- initializeNamespaceRappOptions(), "environment")
  expect_equal(ls(res, all.names=TRUE), c(".rte", ns))
  
  expected <- sort(c(
    "ns",
    "global_dir"
  ))
  expect_equal(ls(res[[ns]], all.names=TRUE), expected)
  
  expected_values <- list(
    global_dir = NA_character_,
    ns = ns
  )
  expect_equivalent(
    lapply(expected, get, envir = res[[ns]]),
    expected_values
  )
  
  setwd(wd_0)
  on.exit({
    options(".rapp" = opts_old)
    .cleanTempDir(x = path)
  })
  
  }
)
