module test_julia_namedtuples

using Test

@test (a=1, b=2) == (a=1, :b=>2)
@test (; :b=>2) == (b=2,)
@test NamedTuple{(:a,:b)}((1,2)) == (a=1, b=2)

d = Dict(:a=>1, :b=>2)
@test (; d...) == (a=1, b=2)
@test d == Dict(pairs((a=1, b=2)))

keys = ["a", "b"]
values = ["1", "2"]
nt = NamedTuple{Symbol.(tuple(keys...))}(values)
@test nt == (a="1", b="2")

end # module test_julia_namedtuples
