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


using Jive
@If VERSION >= v"1.1.0-DEV.792" module test_julia_array_eachrow

using Test

A = [1 2;
     3 4;
     5 6]
@test collect(eachrow(A)) == [[1, 2], [3, 4], [5, 6]]
@test collect(eachcol(A)) == [[1, 3, 5], [2, 4, 6]]

end # @If VERSION >= v"1.1.0-DEV.792" module test_julia_array_eachrow
