module test_julia_indices_linearindices

using Test

T = NTuple{N,UnitRange{Int}} where N
@test T{1}((1:2,)) == (1:2,)
@test T{2}((1:2, 3:4)) == (1:2, 3:4)

@test LinearIndices{1,Tuple{UnitRange{Int}}}((1:2,)) == LinearIndices((1:2,))
@test LinearIndices{2,Tuple{UnitRange{Int},UnitRange{Int}}}((1:2, 3:4)) == LinearIndices((1:2, 3:4))

end # module test_julia_indices


module test_julia_indices_end

using Test

A = [1,2,3]
@test A[end:-1:1] == [3,2,1]

end # module test_julia_indices_end
