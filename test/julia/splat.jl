module test_julia_splat

using Test

@test Base.splat(+)((1,2,3)) == .+(1,2,3) == 6

end # module test_julia_splat
