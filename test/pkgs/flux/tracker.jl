module test_pkgs_flux_tracker

using Test

# code from julialang slack #autodiff Mike Innes
using Flux.Tracker

f(x) = sum(x.^2)

(g,) = Tracker.gradient(f, [1, 2, 3])
@test g isa TrackedArray
@test Tracker.data(g) == [2, 4, 6]

y, back = Tracker.forward(f, [1, 2, 3])
@test y isa Tracker.TrackedReal{Float64}
@test Tracker.data(y) == 14.0

(b,) = back(1)
@test b == g

(b,) = back(2)
@test b == 2g

(b,) = back(3)
@test b == 3g

end # module test_pkgs_flux_tracker
