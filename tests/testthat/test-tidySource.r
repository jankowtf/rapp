context("tidySource-1")
test_that("tidySource", {
  
  input <- substitute(
    list(
      global_dir = file.path(Sys.getenv("HOME"), "rapp"),
      runtime_mode = "dev",
      lib = .libPaths()[1]
    )
  )
  expect_is(res <- tidySource(input = input), "character")
#   cat(res)
  expect_is(res <- tidySource(input = input, name = "test"), "character")
#   cat(res)
#   write(expr, file = file.path(tempdir(), "tidy.r"))  
   
  input <- substitute(
    data.frame(
      x_1 = letters[1:3],
      x_2 = rep(TRUE, 3)
    )
  )
  expect_is(res <- tidySource(input = input), "character")
#   cat(res)             

  input <- substitute(
    foo <- function(x = 1) {
      print(x)
      print("hello world!")
      return(x)
    }
  )
  expect_is(res <- tidySource(input = input), "character")
#   cat(res)             

  }
)
