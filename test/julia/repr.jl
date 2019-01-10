using Jive
@If VERSION >= v"1.2.0-DEV.136" module test_julia_repr

using Test
@test repr.([true]) == ["true"]
@test repr([true]) == "Bool[1]"

end
