#Script to install WAVI. Choose the branch you'd like to install using the rev argument

using Pkg

env_name = "WAVI_ENV" in keys(ENV) ? ENV["WAVI_ENV"] : "wavi_test"
Pkg.activate(env_name)

repo = "WAVI_REPO" in keys(ENV) ? ENV["WAVI_REPO"] :
    "https://github.com/RJArthern/WAVI.jl.git"
rev = "WAVI_REV" in keys(ENV) ? ENV["WAVI_REV"] : "master"

println("Using $repo and $rev")
Pkg.add(PackageSpec(url=repo, rev=rev))
