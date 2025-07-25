module test_julia_abstractset

using Test

@test union((1,3,5,5,5)) == union([1,3,5,5,5]) == [1,3,5]

s1 = Set{Any}(Any[true, 1, 1.0])
@test length(s1) == 1
@test collect(s1) == Any[1.0]

s2 = IdSet{Any}(Any[true, 1, 1.0])
@test length(s2) == 3
@test collect(s2) == Any[true, 1, 1.0]

end # module test_julia_abstractset
