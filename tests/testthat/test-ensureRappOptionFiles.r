context("ensureRappOptionFiles-A")
test_that("ensureRappOptionFiles", {

  expected <- c(file.path(tempdir(), "options_runtime.r"),
                file.path(tempdir(), "options_ns.r"))
  expect_equal(res <- ensureRappOptionFiles(path = tempdir()), expected)
  expect_true(file.exists(expected[1]))
  expect_true(file.exists(expected[2]))
  expect_equal(res <- eval(parse(file=expected[1])),
    list(
      global_dir = file.path(Sys.getenv("HOME"), "rapp"),
      wd = getwd(),
      runtime_mode = "dev",
      lib = .libPaths()[1]
    )
  )
  
  expect_equal(res <- eval(parse(file=expected[2])),
    list(
      ns = libr::asPackage(".")$package,
      is_internal = TRUE,
      global_dir = file.path(Sys.getenv("HOME"), "rapp/ns", 
          libr::asPackage(".")$package),
      github_name = NA_character_,
      option_1 = "your option value here (can be any R object)",
      option_2 = "your option value here (can be any R object)",
      option_3 = "your option value here (can be any R object)"
    )
  )
  
  on.exit({
    unlink(expected[1])
    unlink(expected[2])
  })
  
  }
)
