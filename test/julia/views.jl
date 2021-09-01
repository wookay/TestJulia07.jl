module test_julia_views

using Test

A = [1 2 3; 4 5 6]
first_row = @views A[1, :]
@test first_row isa SubArray
@test eltype(A) === eltype(first_row) === Int
@test ndims(first_row) == 1
@test first_row[3] == 3

first_row[3] = 0
@test A == [1 2 0; 4 5 6]

end # module test_julia_views
