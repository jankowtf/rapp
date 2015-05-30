\dontrun{

## Save current options state //  
opts_old <- getOption(".rapp")

## This expects a rapp HOME directory containing a repository root directory
## with valid subrepositories!
## This might not work if you have not used the rapp framework's features
## for package building 
## (in particular 'reposr::buildIntoRepositoryInfrastructure()')
ensureGlobalDirectory("q:/home/rapp")
ensureDevPackages()
               
## Clean up //
on.exit(options(".rapp" = opts_old))

}
