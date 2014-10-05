options <- list(
	ns = libr::asPackage(x = ".")$package,
	global_dir = file.path(Sys.getenv("HOME"), "rapp/ns", libr::asPackage(x = ".")$package),
	github_name = NA_character_,
	option_1 = "your option value here (can be any R object)",
	option_2 = "your option value here (can be any R object)",
	option_3 = "your option value here (can be any R object)"
)
