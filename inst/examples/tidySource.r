\dontrun{

input <- substitute(
  list(
    rapp_global = file.path(Sys.getenv("HOME"), "rapp"),
    runtime_mode = "dev",
    lib = .libPaths()[1]
  )
)
res <- tidySource(input = input)
cat(res)
res <- tidySource(input = input, name = "test")
cat(res)
write(expr, file = file.path(tempdir(), "tidy.r"))  
 
input <- substitute(
  data.frame(
    x_1 = letters[1:3],
    x_2 = rep(TRUE, 3)
  )
)
res <- tidySource(input = input)
cat(res)             

input <- substitute(
  foo <- function(x = 1) {
    print(x)
    print("hello world!")
    return(x)
  }
)
res <- tidySource(input = input)
cat(res)   

}
