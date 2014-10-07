context("getRappOptions-A")
test_that("getRappOptions", {

  if (is.null(getOption(".rapp"))) {
    expect_equal(getRappOptions(), NULL)
  } else {
    expect_is(getRappOptions(), "environment")
  }
  expect_equal(getRappOptions(id = "abcd"), NULL)
  expect_error(getRappOptions(id = "abcd", strict = TRUE))
  
  }
)
