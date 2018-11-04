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

end
