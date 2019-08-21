module test_julia_math

using Test

@test Base.Math.FMA_NATIVE isa Bool

@test 0.99999999 ≈ 1

end # Base.Math.FMA_NATIVE
