#Script to install WAVI. Choose the branch you'd like to install using the rev argument

# https://stackoverflow.com/questions/57965361/how-to-register-a-local-julia-package-in-a-local-registry
using Pkg

env_name = "WAVI_ENV" in keys(ENV) ? ENV["WAVI_ENV"] : "wavi_test"
Pkg.activate(env_name)

repo = "WAVI_REPO" in keys(ENV) ? ENV["WAVI_REPO"] :
    "https://github.com/RJArthern/WAVI.jl.git"
rev = "WAVI_REV" in keys(ENV) ? ENV["WAVI_REV"] : "master"

dev_folder = nothing

if size(ARGS)[1] > 0
    if "--develop" in ARGS
        dev_folder = ARGS[findfirst(isequal("--develop"), ARGS) + 1]
        println("Using local dev code from $dev_folder")
        Pkg.develop(PackageSpec(path=dev_folder))
    end
end

if typeof(dev_folder) != String
    println("Using $repo and $rev")
    Pkg.add(PackageSpec(url=repo, rev=rev))
end
