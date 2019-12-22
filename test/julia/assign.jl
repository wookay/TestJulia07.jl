module test_julia_assign

using Test

(j, j) = (1, 2)
@test j == 2

tup = 1, 2
@test tup == (1, 2)

d, = 1, 2
@test d == 1

end # module test_julia_assign
