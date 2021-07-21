module test_julia_float

using Test

@test 1000000000000000eps() == 0.2220446049250313
@test eps(10000000000000000.) == 2.0
@test 1e5 == 100000.0

end # module test_julia_float
