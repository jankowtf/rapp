\dontrun{
  
## Save current option state //
opts_old <- getOption(".rapp")
  
## Set options withouth any checks or restrictions //
setRappOption(id = ".rte/test", value = new.env())
getRappOption(id = ".rte/test/a")
setRappOption(id = ".rte/test/a", value = TRUE)
getRappOption(id = ".rte/test/a")
setRappOption(id = ".rte/test/a", value = list(a = 1))
getRappOption(id = ".rte/test/a")

## Leaf must exist //
setRappOption(id = ".rte/test/b", value = TRUE, must_exist = TRUE)
try(setRappOption(id = ".rte/test/b", value = TRUE, 
  must_exist = TRUE, strict = TRUE))
setRappOption(id = ".rte/test/a", value = TRUE, must_exist = TRUE)

## Existin leaf and check for matching classes // 
setRappOption(id = ".rte/test/a", value = "hello world!", match_class = TRUE)
try(setRappOption(id = ".rte/test/a", value = "hello world!", 
  match_class = TRUE, strict = TRUE))
setRappOption(id = ".rte/test/a", value = "hello world!")
getRappOption(id = ".rte/test/a")

## Force branch //
resetRappOptions()
setRappOption(id = "a", value = "hello world!")
getRappOption(id = "a")
setRappOption(id = "a/b", value = TRUE)
try(setRappOption(id = "a/b", value = TRUE, strict = TRUE))
setRappOption(id = "a/b", value = TRUE, force_branch = TRUE)
getRappOption(id = "a/b")
getRappOption(id = "a")

## Fill branches //
resetRappOptions()
setRappOption(id = "a/b/c/d", value = TRUE)
try(setRappOption(id = "a/b/c/d", value = TRUE, strict = TRUE))
setRappOption(id = "a/b/c/d", value = TRUE, branch_gap = TRUE)
getRappOption(id = "a/b/c/d")

## Fill branches in combination with force branch //
resetRappOptions()
setRappOption(id = "a", value = "hello world!")
setRappOption(id = "a/b/c/d", value = TRUE, branch_gap = TRUE)
try(setRappOption(id = "a/b/c/d", value = TRUE, branch_gap = TRUE, strict = TRUE))
setRappOption(id = "a/b/c/d", value = TRUE, branch_gap = TRUE, force_branch = TRUE)
getRappOption(id = "a/b/c/d")

## Numerical names //
resetRappOptions()
setRappOption(id = "20140101", value = "hello world!")
getRappOption(id = "20140101")

## Clean up //
on.exit(options(".rapp" = opts_old))

}
