context("processRepositoryData-1")
test_that("processRepositoryData", {

#   .cleanTempDir <- function(x) {
#     if (grepl(basename(tempdir()), x)) {
#       unlink(x, recursive = TRUE, force = TRUE)
#     }
#   }
  
  opts_old <- getOption(".rapp")
  
  ## Create example content //
  ensureRappOptionsContainer(overwrite = TRUE)
  setRappHome("q:/home/rapp")
  setInternalRepositories()

  expect_true(res <- processRepositoryData())
  expect_true(file.exists(gsub("file:///", "", getRappOption(".rte/repos_global"))))
  expect_true(file.exists(gsub("file:///", "", getRappOption(".rte/repos_pkg"))))
  
  on.exit({
    options(".rapp" = opts_old)
#     .cleanTempDir(x = gsub("\\\\", "/", file.path(tempdir(), "repos")))
  })
  
  }
)
