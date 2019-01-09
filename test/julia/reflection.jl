module test_reflection

using Test

@test :Float64 == nameof(Float64)
@test :Float64 == Base.typename(Float64).name
@test 8 == sizeof(Float64)
@test 8 == sizeof(1.0)
@test 8 == sizeof(1)
@test 0 == sizeof("")
@test 1 == sizeof("a")
@test 3 == sizeof("헐")

end # module test_reflection
