context("isRapp-1")
test_that("isRapp", {

  if (basename(getwd()) == "testthat") {
    path_0 <- "data"
  } else{
    path_0 <- "tests/testthat/data"
  }
#   path <- file.path(path_0, c("package_valid", paste0("package_invalid_", 1:4)))
#   
#   expect_equivalent(
#     sapply(path, isRapp),
#     c(TRUE, rep(FALSE, 4))
#   )
#   sapply(path[2:5], function(ii) {
#     expect_error(isRapp(path = ii, strict = TRUE))
#   })

  expect_true(isRapp(path = file.path(path_0, "rapp.test.1")))
  
  }
)
