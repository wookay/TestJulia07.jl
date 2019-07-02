module test_julia_sort

using Test

@test sortperm([5,6,7]) == 1:3
@test sortperm([6,5,7]) == [2,1,3]
@test sort([6,5,7]) == [5,6,7]

end # module test_julia_sort
