module test_julia_math

using Test

@test Base.Math.FMA_NATIVE isa Bool

@test 0.99999999 ≈ 1

# Hodge star operator
@test Symbol(Char(0x22c6)) === :⋆

⋆(n) = n
@test ⋆(1) == 1

end # Base.Math.FMA_NATIVE
