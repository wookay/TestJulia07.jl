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


module test_julia_number_egal

using Test

@test   1.0 ==  1
@test !(1.0 === 1)

@test   false ==  0
@test !(false === 0)

end # module test_julia_number_egal


module test_julia_number_binary_representation

using Test

@test count_ones(3) == 2

end # module test_julia_number_binary_representation


module test_julia_number_exp2

using Test

@test   8 ==  8.0
@test !(8 !=  8.0)
@test   8 !== 8.0
@test !(8 === 8.0)

@test ^(2, 3) === 8
@test 0x1p3 === exp2(3) === ^(2.0, 3) === 8.0

end # test_julia_number_exp2


module test_julia_number_signbit

using Test

@test 0 == 0.0 == -0.0
@test 0   === -0
@test 0.0 !== -0.0
@test signbit(-0.0)
@test signbit( 0.0) === signbit(0) === false

end # module test_julia_number_signbit
