module test_julia_symbols

using Test

a,b = 1,2
@test a:b === 1:2
@test (:) isa Colon
@test 1:2 isa UnitRange{Int}
@test  :b ===  :b
@test var"a" == 1
name = :a
@test var"name" === :a
@test :var"a" === Symbol(name)
@test :var"name" === Symbol("name")
@test isdefined(@__MODULE__, var"name")
@test isdefined(@__MODULE__, :var"name")

@test Symbol("F") === :F
@test Symbol(".") === :.
@test Symbol(":") === :(:)
@test Symbol("::") === :(::)

@test :(:)   isa Symbol
@test :(::)  isa Symbol
@test :(:::) isa Expr
@test :(:::) == Expr(:(::), :(:))

@test :var"" === Symbol() === Symbol("")

@test !isa(:1, Symbol)
@test :1 == 1
@test Symbol(1) === Symbol("1")

@test :true === true === Bool(1)
@test !(:true isa Symbol)
@test :false === false === Bool(0)

@test :var"true" === Symbol(true) == Symbol("true") === Symbol("tru", "e")

@test :nothing isa Symbol
@test Symbol(nothing) === Symbol("nothing") === :nothing

@test :var"a b" === Symbol("a b")
@test :var"a.b" === Symbol("a.b")

end # module test_julia_symbols
