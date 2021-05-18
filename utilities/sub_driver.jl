#include everything the code directory
for f in readdir("code")
    if f[end-2:end] == ".jl"
        println("included code: ", f)
        include(string("code/", f))
    end
end


#run the driver script
include("driver.jl")
driver()
