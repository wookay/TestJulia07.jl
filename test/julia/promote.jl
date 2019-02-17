module test_julia_promote

using Test

@test promote() == ()
@test promote(1) == (1,)

end # module test_julia_promote


module test_julia_promote_type

using Test

@test promote_type(UInt8, Int8) === UInt8
@test promote_type(UInt8, Int16) === Int16

end # module test_julia_promote_type


module test_julia_promote_shape

using Test

a = fill(0, (3,4,))
b = fill(0, (3,4,1))
@test promote_shape(a,b) == (Base.OneTo(3), Base.OneTo(4), Base.OneTo(1))

end # module test_julia_promote_shape


module test_julia_promote_op

using Test

@test Base.promote_op(*, Bool) === Bool
@test Base.promote_op(+, Bool) === Int
@test Base.promote_op(*, Char) === String

end # module test_julia_promote_op
