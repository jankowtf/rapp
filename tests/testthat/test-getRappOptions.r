context("getRappOptions-A")
test_that("getRappOptions", {

  expect_is(getRappOptions(), "environment")
  expect_equal(getRappOptions(id = "abcd"), NULL)
  expect_error(getRappOptions(id = "abcd", strict = TRUE))
  
  }
)
