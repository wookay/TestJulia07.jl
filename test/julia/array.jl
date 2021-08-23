module test_julia_array

using Test

A = [6, 5, 4, 3, 2, 1]
@test 2 == splice!(A, 5)
@test [6, 5, 4, 3, 1] == A

A = [6, 5, 4, 3, 2, 1]
@test 2 == splice!(A, 5, [])
@test [6, 5, 4, 3, 1] == A

A = [6, 5, 4, 3, 2, 1]
@test 2 == splice!(A, 5, 10)
@test [6, 5, 4, 3, 10, 1] == A

A = [6, 5, 4, 3, 2, 1]
@test 2 == splice!(A, 5, [10, 11])
@test [6, 5, 4, 3, 10, 11, 1] == A

@test circshift(1:3, 1) == [3, 1, 2]

end # module test_julia_array


module test_julia_array_hcat

using Test

@test hcat([1,2,3]...) == reduce(hcat, [1,2,3]) == [1 2 3]

end # module test_julia_array_hcat


module test_julia_array_broadcast

using Test

@test (["a","b","c"] .=> [1,2,3]) == ["a"=>1, "b"=>2, "c"=>3]

end # module test_julia_array_broadcast


module test_julia_array_bool

using Test

@test !([] isa Array{Bool})
@test !([1] isa Array{Bool})
@test Bool[] isa Array{Bool}
@test Bool[1] isa Array{Bool}
@test [true] isa Array{Bool}
@test [true false] isa Array{Bool}
@test_throws InexactError Bool[2] isa Array{Bool}

end # module test_julia_array_bool


module test_julia_array_indices

using Test

A = Matrix(reshape(1:16, (4,4)))

@test LinearIndices(A)[2,2] == LinearIndices(A)[6] == 6
@test CartesianIndices(A)[2,2] == CartesianIndices(A)[CartesianIndex(2,2)] == CartesianIndex(2,2)

end #  module test_julia_array_indices


module test_julia_array_math

using Test

A = [1 2;
     3 4]

@test reverse(A, dims=1) == [3 4; 1 2]
@test reverse(A, dims=2) == [2 1; 4 3]

end # module test_julia_array_math


module test_julia_array_only_first

using Test

@test_throws ArgumentError only([])
@test_throws BoundsError   first([])

end # module test_julia_array_only_first
