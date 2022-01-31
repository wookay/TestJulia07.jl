module test_julia_math

using Test

if VERSION < v"1.8.0-DEV.1087"
@test Base.Math.FMA_NATIVE isa Bool
end

@test 0.99999999 ≈ 1

# Hodge star operator
@test Symbol(Char(0x22c6)) === :⋆

⋆(n) = n
@test ⋆(1) == 1

@test sqrt(2) == hypot(1, 1)
@test sqrt(5) == hypot(2, 1) == hypot(1, 2)
@test sqrt(8) == hypot(2, 2)
@test 3.0 == hypot(2, 1, 2)

@test ℯ^(im)π ≈ -1

end # module test_julia_math


module test_julia_math_hypot

using Test

@test hypot(3, 4) == 5

end # module test_julia_math_hypot
