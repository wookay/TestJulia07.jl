module test_julia_core

using Test

module A
_val = nothing
end

@test A._val === nothing

Core.eval(A, :(_val = 1))

@test A._val == 1

end # module test_julia_core


module test_julia_core_compiler

using Test
using Core.Compiler: ⊑

@test Int ⊑ Integer

end # module test_julia_core_compiler
