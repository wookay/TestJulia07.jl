module test_julia_tuples_ntuple

using Test

@test tuple(1:3...) == ntuple(identity, 3) == (1, 2, 3)

@test ntuple(M -> 2, 1) == (2,)
@test ntuple(M -> 2, 3) == (2, 2, 2)
@test ntuple(M -> 2, Val(1)) == (2,)
@test ntuple(M -> 2, Val(3)) == (2, 2, 2)

end # module test_julia_tuples


module test_julia_tuples_front_tail

using Test

@test Base.front((1,)) == ()
@test Base.tail((1,)) == ()

end # module test_julia_tuples_front_tail
