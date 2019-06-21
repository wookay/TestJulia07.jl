module test_julia_reduce

using Test

@test mapfoldl((x -> [x, x+1]), vcat, [5, 8]) == [5, 6, 8, 9]

end # module test_julia_reduce
