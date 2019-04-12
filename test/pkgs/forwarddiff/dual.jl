module test_pkgs_forwarddiff_dual

using Test
using ForwardDiff: Dual, Tag, derivative, gradient, jacobian

# Perturbation Confusion
# https://github.com/JuliaDiff/ForwardDiff.jl/issues/83
const D = derivative
@test D(x -> x * D(y -> x + y, 1), 1) == 1
@test D(x -> x * D(y -> y^2, 1), 1) == 2
@test D(sin, 1pi) == cos(1pi) == -1

f(x) = 2x
y = gradient(f, -2pi:2pi)

@test y isa Vector{Vector{Dual{Tag{typeof(f),Float64},Float64,7}}}
@test y[1] isa Vector{Dual{Tag{typeof(f),Float64},Float64,7}}

@test y[1][1] == Dual{Tag{typeof(f),Float64}}(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
@test jacobian(f, y[1])[1] == Dual{Tag{typeof(f),Float64}}(2.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)

end # module test_pkgs_forwarddiff_dual
