module test_julia_assign

using Test

(j, j) = (1, 2)
@test j == 2

end # module test_julia_assign
