context("Namespace.S3_A")
test_that("Namespace.S3", {

  expect_is(Namespace.S3(), "Namespace.S3")
  expect_is(Namespace.S3(TRUE), "Namespace.S3")
  expect_is(res <- Namespace.S3(ns = "rapp"), "Namespace.S3")
  expect_is(res$ns, "character")
  
})

