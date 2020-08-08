module test_julia_package_callbacks

callback = (mod::Base.PkgId) -> println("package_callbacks: ", mod)
push!(Base.package_callbacks, callback)

using LinearAlgebra
using Jive

end # module test_julia_package_callbacks
