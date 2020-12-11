using Jive # @If
@If VERSION >= v"1.1.0-DEV.764" module test_julia_locals

using Test

output = let x = 1
    sprint(show, Base.@locals)
end

if VERSION >= v"1.6.0-DEV.849"
    @test output == "Dict{Symbol, Any}(:x => 1)"
end

end # @If VERSION >= v"1.1.0-DEV.764" module test_julia_locals
