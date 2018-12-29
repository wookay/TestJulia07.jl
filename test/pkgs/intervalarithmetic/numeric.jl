module test_pkgs_intervalarithmetic_numeric

using Test
using IntervalArithmetic

a = 0..∞
@test a isa Interval{Float64}
@test (a.lo, a.hi) == (0.0, Inf)

end # module test_pkgs_intervalarithmetic_numeric
