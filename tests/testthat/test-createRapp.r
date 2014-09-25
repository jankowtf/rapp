context("createRapp-1")
test_that("createRapp", {

  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  
  
  if (basename(getwd()) == "testthat") {
    path_0 <- "data"
  } else{
    path_0 <- "tests/testthat/data"
  }
#   path <- file.path(path_0, c("rapp_valid", paste0("rapp_invalid_", 1:4)))
  
  expect_equal(res <- createRapp(id = "rapp.test.1", path = tempdir()), 
               file.path(tempdir(), "rapp.test.1"))
               
  if (FALSE) {
    id <- "rapp.test.1"
    res <- createRapp(id = id, path = path_0)
  }

  on.exit(.cleanTempDir(x = file.path(tempdir(), "rapp.test.1")))  

  }
)

