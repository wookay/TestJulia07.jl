module test_julia_symbols

using Test

a,b = 1,2
@test a:b === 1:2
@test (:) isa Colon
@test 1:2 isa UnitRange{Int}
@test  :b ===  :b

@test Symbol("F") === :F
@test Symbol(".") === :.
@test Symbol(":") === :(:)
@test Symbol("::") === :(::)

@test :(:)   isa Symbol
@test :(::)  isa Symbol
@test :(:::) isa Expr
@test :(:::) == Expr(:(::), :(:))

@test :var"a" === :a

@test !isa(:1, Symbol)
@test :1 == 1
@test Symbol(1) === Symbol("1")

end # module test_julia_symbols
