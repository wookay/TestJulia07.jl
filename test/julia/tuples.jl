module test_julia_tuples

using Test

@test tuple(1:3...) == ntuple(identity, 3) == (1, 2, 3)

end # module test_julia_tuples
