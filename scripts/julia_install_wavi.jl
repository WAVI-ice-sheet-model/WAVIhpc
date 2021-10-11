#Script to install WAVI. Choose the branch you'd like to install using the rev argument 

using Pkg
#Pkg.add("Example")
#Pkg.add(url="https://github.com/RJArthern/WAVI.jl#AlexDev")
Pkg.add(PackageSpec(url="https://github.com/RJArthern/WAVI.jl.git", rev="AlexDev"))


