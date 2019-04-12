module test_julia_expr

using Test

name = :GTypePlugin
expr = :( g(::Type{T}) where T <: $(esc(name)) = 0)
#@info :expr expr
#┌ Info: expr
#│   expr =
#│    :((g(::Type{T}) where T <: $(Expr(:escape, :GTypePlugin))) = begin
#│              #= /Users/hulpd/.julia/dev/TestJulia07/test/expr.jl:2 =#
#│              0
#└          end)

macro a()
    (__module__, __source__)
end

(m, s) = @a()
@test m === Main.test_julia_expr
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

end # module test_julia_expr


module test_julia_expr_gensym

using Test

@test gensym() != gensym()

@gensym d
@test d isa Symbol

end # module test_julia_expr_gensym
