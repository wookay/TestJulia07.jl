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


module test_julia_destructure_callex

using Test

macro destructure(ex)
    f, args, kwargs = Base.destructure_callex(ex)
    (f, args, kwargs)
end

(f, args, kwargs) = @destructure f(a::Int; b=2)
@test f === :f
@test args == Any[:(a::Int)]
@test kwargs == Any[Expr(:kw, :b, 2)]

@test (f, args, kwargs) == Base.destructure_callex(:(f(a::Int; b=2)))

q = quote f(a::Int; b=2) end
@test q.args[1] isa LineNumberNode
@test :(f(a::Int; b=2)) == q.args[2]

end # module test_julia_destructure_callex
