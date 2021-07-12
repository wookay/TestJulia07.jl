module test_julia_symbols

using Test

a,b = 1,2
@test a:b === 1:2
@test (:) isa Colon
@test 1:2 isa UnitRange{Int}
@test  :b ===  :b

@test Symbol("F") === :F
@test Symbol(".") === :.

end # module test_julia_symbols
