context("getNsRappOption-1")
test_that("getNsRappOption", {

#   skip("not finished yet")
  opts_old <- getOption(".rapp")
  
  if (basename(getwd()) == "testthat") {
    path_0 <- "data"
  } else {
    path_0 <- "tests/testthat/data"
  }
  
  ## Create test package //
  if (!"test.package" %in% list.files(path_0)) {
    path <- createPackageSkeleton(id = "test.package", path = path_0, 
                                  overwrite = TRUE)
    ensureProjectComponents(path = path)
  } else {
    path <- file.path(path_0, "test.package")
  }
  wd_0 <- setwd(path)
  
  initializeRappOptions()
  initializeNsRappOptions()
  mergeNsRappOptions()
  expect_is(res <- getNsRappOption(), "environment")
  expect_true(length(ls(res)) > 0)
  expect_equal(getNsRappOption(id = "github_name"), NA_character_)
  expect_is(res <- getNsRappOption(id = "global_dir"), "character")
  expect_true(!is.na(res))
  expect_equal(res <- getNsRappOption(id = "ns"), "test.package")
              
  setwd(wd_0)
  on.exit(options(".rapp" = opts_old))
  
  }
)

