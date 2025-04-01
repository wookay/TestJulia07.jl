module test_julia_reduce

using Test

@test mapfoldl((x -> [x, x+1]), vcat, [5, 8]) == [5, 6, 8, 9]

@test sum(identity, (1, 2, 3)) == 6
@test sum(isodd, 1:100) == 50

end # module test_julia_reduce
