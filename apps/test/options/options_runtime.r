options_runtime <- list(
	global_dir = file.path(Sys.getenv("HOME"), "rapp"),
	runtime_mode = "dev",
	lib = .libPaths()[1],
	wd = getwd()
)
