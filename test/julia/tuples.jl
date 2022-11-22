module test_julia_tuples

using Test

@test Tuple{}(()) == Tuple(()) == Tuple{}() == ()
@test_throws MethodError Tuple()

end # module test_julia_tuples


module test_julia_tuples_ntuple

using Test

@test tuple() == ()
@test tuple(1,) == (1,)

@test tuple(1:3...) == ntuple(identity, 3) == (1, 2, 3)
@test tuple([1, 2, 3]) == ([1, 2, 3],)

@test ntuple(M -> 2, 1) == (2,)
@test ntuple(M -> 2, 3) == (2, 2, 2)
@test ntuple(M -> 2, Val(1)) == (2,)
@test ntuple(M -> 2, Val(3)) == (2, 2, 2)

end # module test_julia_tuples


module test_julia_tuples_front_tail

using Test

@test Base.front((1,)) == ()
@test Base.front((1,2,3)) == (1, 2)
@test Base.tail((1,)) == ()
@test Base.tail((1,2,3)) == (2, 3)

end # module test_julia_tuples_front_tail
