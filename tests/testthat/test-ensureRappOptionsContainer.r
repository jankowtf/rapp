context("ensureRappOptionsContainer-1")
test_that("ensureRappOptionsContainer", {

  opts_old <- getOption(".rapp")
  expect_is(res <- ensureRappOptionsContainer(), "environment")
  expect_is(res <- ensureRappOptionsContainer(overwrite = TRUE), "environment")
  on.exit(options(".rapp" = opts_old))
  }
)
