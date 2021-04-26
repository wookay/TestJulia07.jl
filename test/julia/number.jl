module test_julia_number

using Test

@test iszero(zero(1))
@test isone(one(0))

end # module test_julia_number


module test_julia_number_adjoint

using Test

@test im' == -im
@test im'' == im
@test conj(im) == (transpose ∘ conj)(im) == adjoint(im)

end # module test_julia_number_adjoint


module test_julia_number_isless

using Test

@test isless(-0.0, 0.0)
@test !(-0.0 < 0.0)

end # module test_julia_number_isless
