module test_pkgs_flux_basic

using Flux
using Test

d = Dense(5, 2) # in out σ=identity
x = rand(5)
@test d(x) ≈ d.σ.(d.W * x + d.b)

end # module test_pkgs_flux_basic
