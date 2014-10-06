\dontrun{

path <- tempdir()
res <- ensureRappOptionFiles(path = path)
res
opts_runtime <- eval(parse(file = res[1]))
opts_runtime
opts_rapp <- eval(parse(file = res[2]))
opts_rapp

}
