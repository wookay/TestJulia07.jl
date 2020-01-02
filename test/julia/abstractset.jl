module test_julia_abstractset

using Test

@test union((1,3,5,5,5)) == union([1,3,5,5,5]) == [1,3,5]

end # module test_julia_abstractset
