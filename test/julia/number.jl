module test_julia_number

using Test

@test iszero(zero(1))
@test isone(one(0))

end # module test_julia_number
