module test_pkgs_forwarddiff_dual

using ForwardDiff
using Test

# Perturbation Confusion
# https://github.com/JuliaDiff/ForwardDiff.jl/issues/83
const D = ForwardDiff.derivative
@test D(x -> x * D(y -> x + y, 1), 1) == 1
@test D(x -> x * D(y -> y^2, 1), 1) == 2
@test D(sin, 1pi) == cos(1pi) == -1

const G = ForwardDiff.gradient
f(x) = 2x
y = G(f, -2pi:2pi)
@test y[1] isa Vector{ForwardDiff.Dual{ForwardDiff.Tag{typeof(f),Float64},Float64,7}}

end # module test_pkgs_forwarddiff_dual
