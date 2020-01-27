module test_julia_math

using Test

@test Base.Math.FMA_NATIVE isa Bool

@test 0.99999999 ≈ 1

# Hodge star operator
@test Symbol(Char(0x22c6)) === :⋆

⋆(n) = n
@test ⋆(1) == 1

@test sqrt(2) == hypot(1, 1)
@test sqrt(5) == hypot(2, 1) == hypot(1, 2)
@test sqrt(8) == hypot(2, 2)
@test 3.0 == hypot(2, 1, 2)

end # Base.Math.FMA_NATIVE
