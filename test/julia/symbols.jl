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

@test !(:false isa Symbol)
@test false === :false

@test Symbol(true) !== true
@test Symbol(false) !== false
@test Symbol(true) === Symbol("true") !== :true
@test Symbol(false) === Symbol("false") !== :false

@test Bool(1) === :true === true
@test Bool(0) === :false === false

@test :nothing isa Symbol
@test Symbol(nothing) === Symbol("nothing") === :nothing

end # module test_julia_symbols
