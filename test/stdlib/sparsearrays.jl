module test_stdlib_sparsearrays

using Test
using SparseArrays

A = sparsevec([3,1,4,1,5,9,2])
@test A.nzval == [3,1,4,1,5,9,2]
@test A.nzind == 1:7
@test length(A) == 7
@test !isempty(dropzeros(A).nzind)

B = sparsevec([3,1,4,1,5,9,2], [0,0,0,0,0,0,0])
@test B.nzval == zeros(Int, 6)
@test B.nzind == [1,2,3,4,5,9]
@test length(B) == 9
@test isempty(dropzeros(B).nzind)

end # module test_stdlib_sparsearrays


module test_stdlib_sparsearrays_non_numerical_data

using Test
using SparseArrays

Base.zero(s::String)  = ""
A = sparse(["a", "b"])
@test A[1] == "a"

end # module test_stdlib_sparsearrays_non_numerical_data
