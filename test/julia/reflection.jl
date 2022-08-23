module test_reflection

using Test

@test :Float64 === nameof(Float64)
@test :Float64 === Base.typename(Float64).name
@test 8 == sizeof(Float64)
@test 8 == sizeof(1.0)
@test 8 == sizeof(1)
@test 0 == sizeof("")
@test 1 == sizeof("a")
@test 3 == sizeof("헐")

@test 8 == sizeof(eltype([1, 2, 3])) == Base.elsize([1, 2, 3])

end # module test_reflection


using Jive
@If VERSION >= v"1.2.0-DEV.218" module test_reflection_hasmethod

using Test

g(; b, c, a) = a + b + c

@test hasmethod(g, Tuple{}, (:a, :b, :c))

end # @If v"1.2.0-DEV.218" >= VERSION module test_reflection_hasmethod


module test_reflection_return_types

using Test

@test only(Base.return_types(==, Tuple{Int, Int})) === Bool

end # module test_reflection_return_types
