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
