module test_julia_expr_hygiene

using Test

name = :GTypePlugin
expr = :( g(::Type{T}) where T <: $(esc(name)) = 0)
#@info :expr expr
#┌ Info: expr
#│   expr =
#│    :((g(::Type{T}) where T <: $(Expr(:escape, :GTypePlugin))) = begin
#│              #= /Users/wookyoung/.julia/dev/TestJulia07/test/expr.jl:2 =#
#│              0
#└          end)

macro a()
    (__module__, __source__)
end

(m, s) = @a()
@test m === test_julia_expr_hygiene
@test s.line == 19

# Hygienic macros are macros whose expansion is guaranteed not to cause the accidental capture of identifiers.
macro hygienex()
    :(x = 0)
end

macro zerox()
    esc(:(x = 0))
end

x = 1
@hygienex
#@info :hygienex x
@test x == 1

@zerox
#@info :escx x
@test x == 0

end # module test_julia_expr_hygiene


module test_julia_expr_gensym

using Test

@test gensym() != gensym()

@gensym d
@test d isa Symbol

end # module test_julia_expr_gensym


module test_julia_expr_kw

using Test

b = Expr(:kw, :a, 1)
expr1 = Expr(:(=),
           Expr(:call,
               :f,
               Expr(:parameters,
                    b)),
           Expr(:block, LineNumberNode(1, :none), :b))
eval(expr1)
@test f(a=2) == b

c = Expr(:parameters, b)
d = Expr(:parameters, b, Expr(:kw, :x, 8))
e = Expr(:parameters, b, Expr(:(...), :kwargs))
expr2 = quote
    g1(; a=1) = a
    g2(; a=1) = b
    g3(; $b) = 3
    g4($c) = 4
    g5($d) = (a+x)
    g6($e) = a + sum(values(kwargs))
    g7($e) = Dict{Symbol,Any}(=>(b.args...), kwargs...)
    function g8(; kwargs...)
        f(; kwargs...) = Dict{Symbol, Any}(kwargs...)
        f(; $b, kwargs...)
    end
end
eval(expr2)
@test g1(a=2) == 2
@test g2(a=2) == b
@test g3(a=2) == 3
@test g4(a=2) == 4
@test g5(x=7) == 8
@test g6(a=2, y=1, z=3) == 6
@test g7() == Dict{Symbol, Any}(:a => 1)
@test g7(y=1) == Dict{Symbol, Any}(:a => 1, :y => 1)
@test g8(y=1) == Dict{Symbol, Any}(:a => 1, :y => 1)
@test g8(a=2, y=1) == Dict{Symbol, Any}(:a => 2, :y => 1)

end # module test_julia_expr_kw


module test_julia_expr2

using Test

@test :(+) isa Symbol
@test :(+ +) isa Expr
@test :(- -) isa Expr

end # module test_julia_expr2
