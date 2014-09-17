context("setRappOption-1")
test_that("setRappOption", {

  opts_old <- getOption(".rapp")
  
  ## Create example content //
  container <- initializeRappOptions()
  
  expect_true(res <- setRappOption(id = "test", value = TRUE))
  expect_equal(res <- getRappOption(id = "test"), TRUE)
  expect_true(res <- setRappOption(id = ".rte/test", value = new.env()))
  expect_true(res <- setRappOption(id = ".rte/test/a", value = TRUE))
  expect_equal(res <- getRappOption(id = ".rte/test/a"), TRUE)
  expect_false(res <- setRappOption(
    id = ".rte/test/b", 
    value = TRUE,
    must_exist = TRUE
  ))
  expect_error(res <- setRappOption(
    id = ".rte/test/b", 
    value = TRUE,
    must_exist = TRUE,
    strict = TRUE
  ))
  expect_false(res <- setRappOption(
    id = ".rte/test/a", 
    value = "hello world!",
    match_class = TRUE
  ))
  expect_error(res <- setRappOption(
    id = ".rte/test/a", 
    value = "hello world!",
    match_class = TRUE,
    strict = TRUE
  ))
  expect_true(res <- setRappOption(
    id = ".rte/test/a", 
    value = "hello world!"
  ))
  expect_equal(res <- getRappOption(id = ".rte/test/a"), "hello world!")
  
  container <- initializeRappOptions()
  expect_false(setRappOption(id = "a/b/c/d", value = TRUE))
  expect_error(setRappOption(id = "a/b/c/d", value = TRUE, strict = TRUE))
  expect_true(setRappOption(id = "a/b/c/d", value = TRUE, branch_gap = TRUE))
  expect_equal(res <- getRappOption(id = "a/b/c/d"), TRUE)
  
  container <- initializeRappOptions()
  expect_true(setRappOption(id = "a", value = "hello world!"))
  expect_false(setRappOption(id = "a/b/c/d", value = TRUE, branch_gap = TRUE))
  expect_error(setRappOption(id = "a/b/c/d", value = TRUE, 
     branch_gap = TRUE, strict = TRUE))
  expect_true(setRappOption(id = "a/b/c/d", value = TRUE, 
     branch_gap = TRUE, force_branch = TRUE))
  expect_equal(res <- getRappOption(id = "a/b/c/d"), TRUE)
  
  container <- initializeRappOptions()
  expect_true(setRappOption(id = "a", value = "hello world!"))
  expect_false(setRappOption(id = "a/b", value = TRUE, branch_gap = TRUE))
  expect_error(setRappOption(id = "a/b", value = TRUE, 
     branch_gap = TRUE, strict = TRUE))
  expect_true(setRappOption(id = "a/b", value = TRUE, 
     force_branch = TRUE))
  expect_equal(res <- getRappOption(id = "a/b"), TRUE)
  
  on.exit(options(".rapp" = opts_old))
  
  }
)
