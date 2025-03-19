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

@test Bool(1) === true === :true
@test Bool(0) === false === :false
@test !isdefined(@__MODULE__, Symbol(true))

var"true" = "var true"
@test isdefined(@__MODULE__, Symbol(true))

@test Symbol("tru", "e") === Symbol("true") === Symbol(true)
@test Symbol(true) !== true

@test :nothing isa Symbol
@test Symbol(nothing) === Symbol("nothing") === :nothing

@test :var"a b" === Symbol("a b")

end # module test_julia_symbols
