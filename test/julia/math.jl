module test_julia_math

using Test

@test Base.Math.FMA_NATIVE isa Bool

end # Base.Math.FMA_NATIVE
