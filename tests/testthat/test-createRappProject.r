context("createRappProject-1")
test_that("createRappProject", {
  skip("interactive only")
  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }

#   if (basename(getwd()) == "testthat") {
#     path_0 <- "data"
#   } else{
#     path_0 <- "tests/testthat/data"
#   }
#   path <- file.path(path_0, c("rapp_valid", paste0("rapp_invalid_", 1:4)))
# wd_0 <- setwd("tests/testthat")
  expect_equal(res <- createRappProject(id = "rapp.test.1", path = tempdir()), 
               file.path(tempdir(), "rapp.test.1"))
  filesystr::openRessource(tempdir())               
  if (FALSE) {
    id <- "rapp.test.1"
    res <- createRappProject(id = id, path = path_0)
  }

#   on.exit(.cleanTempDir(x = file.path(tempdir(), "rapp.test.1")))  

  }
)

