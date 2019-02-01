module test_julia_rounding

using Test

@test round(pi, digits=2) == 3.14
@test round(pi, sigdigits=3) == 3.14

end # module test_julia_rounding
