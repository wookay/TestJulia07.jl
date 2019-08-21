module test_julia_abstractarraymath

using Test

@test collect(eachrow([1, 2, 3])) == [[1], [2], [3]]
@test collect(eachrow([1 2 3; ])) == [[1, 2, 3]]
@test collect(eachrow([])) == []
@test collect(eachrow([]')) == [[]]

@test collect(eachcol([1, 2, 3])) == [[1, 2, 3]]
@test collect(eachcol([1 2 3; ])) == [[1], [2], [3]]
@test collect(eachcol([])) == [[]]
@test collect(eachcol([]')) == []

@test collect(eachslice([1 2 3;], dims=1)) == [[1, 2, 3]]
@test collect(eachslice([1 2 3;], dims=2)) == [[1], [2], [3]]

end # module test_julia_abstractarraymath
