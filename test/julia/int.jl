module test_julia_int

using Test

@test 3 == trailing_ones(0b111)
@test 64 == trailing_zeros(0)

end # module test_julia_int
