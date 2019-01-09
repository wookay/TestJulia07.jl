module test_julia_axes

using Test

A = [1 2; 3 4; 5 6; 7 8;]
#=
4×2 Array{Int64,2}:
 1  2
 3  4
 5  6
 7  8
=#

@test size(A) == (4, 2)
@test axes(A, 1) == Base.OneTo(4)
@test axes(A, 2) == Base.OneTo(2)

end # module test_julia_axes
