using Test

@test (a=1, b=2) == (a=1, :b=>2)
@test (; :b=>2) == (b=2,)
@test NamedTuple{(:a,:b)}((1,2)) == (a=1, b=2)