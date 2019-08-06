module test_pkgs_flux_tracker

using Test

# code from julialang slack #autodiff Mike Innes
using Tracker
using Flux

f(x) = sum(x.^2)
(g,) = Tracker.gradient(f, [1, 2, 3])
@test Tracker.data(g) == [2, 4, 6] == (x->2x.^1).([1,2,3])
y, back = Tracker.forward(f, [1, 2, 3])
@test y isa Tracker.TrackedReal{Float64}
@test Tracker.data(y) == 14 == f([1,2,3])
@test back(1)[1] == g
@test back(2)[1] == 2g
@test back(3)[1] == 3g


f(x) = sum(x.^3)
(g,) = Tracker.gradient(f, [1, 2, 3])
@test Tracker.data(g) == [3, 12, 27] == (x->3x.^2).([1,2,3])
y, back = Tracker.forward(f, [1, 2, 3])
@test Tracker.data(y) == 36 == f([1,2,3])
@test back(1)[1] == g
@test back(2)[1] == 2g
@test back(3)[1] == 3g


f(x) = sum(x.^5)
(g,) = Tracker.gradient(f, [1, 2, 3])
@test Tracker.data(g) == [5, 80, 405] == (x->5x.^4).([1,2,3])
y, back = Tracker.forward(f, [1, 2, 3])
@test Tracker.data(y) == 276 == f([1,2,3])
@test back(1)[1] == g
@test back(2)[1] == 2g
@test back(3)[1] == 3g

(g,) = Tracker.gradient(f, [5, 8, 11, 21])
@test Tracker.data(g) == [3125, 20480, 73205, 972405] == (x->5x.^4).([5, 8, 11, 21])
y, back = Tracker.forward(f, [5, 8, 11, 21])
@test Tracker.data(y) == 4281045 == f([5,8,11,21])
@test back(1)[1] == g
@test back(2)[1] == 2g
@test back(3)[1] == 3g


f(x) = sum(sin.(x))
(g,) = Tracker.gradient(f, -2pi:2pi)
@test Tracker.data(g) == cos.(-2pi:2pi) ≈ [1.0, 0.5403023058681395, -0.41614683654714263, -0.9899924966004455, -0.6536436208636117, 0.2836621854632265, 0.9601702866503661, 0.7539022543433045, -0.14550003380861376, -0.911130261884677, -0.8390715290764523, 0.004425697988051031, 0.8438539587324922]
y, back = Tracker.forward(f, -2pi:2pi)
@test Tracker.data(y) == -0.12537475333312798 == f(-2pi:2pi)
@test back(1)[1] == g
@test back(2)[1] == 2g
@test back(3)[1] == 3g

end # module test_pkgs_flux_tracker
