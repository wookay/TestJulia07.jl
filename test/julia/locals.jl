using Jive # @If

@If VERSION >= v"1.1.0-DEV.764" module test_julia_locals

using Test

using DataLogger

output = DataLogger.read_stdout() do
    let x =1
        show(Base.@locals)
    end
end

@test output == "Dict{Symbol,Any}(:x=>1)"

end # @If VERSION >= v"1.1.0-DEV.764" module test_julia_locals
