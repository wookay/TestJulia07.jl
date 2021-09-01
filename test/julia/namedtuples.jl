module test_julia_namedtuples

using Test

@test NamedTuple() == (;)

@test (a=1, b=2) == (a=1, :b=>2)
@test (b=2,) == (; b=2) == (; :b=>2)

b = 2
@test (; b) == (b=2,)

@test NamedTuple{(:a, :b),Tuple{Int,Int}}((1, 2)) == NamedTuple{(:a, :b)}((1, 2)) == (a=1, b=2)

d = Dict(:a=>1, :b=>2)
@test (; d...) == (a=1, b=2)
@test d == Dict(pairs((a=1, b=2)))

keys = ["a", "b"]
values = ["1", "2"]
nt = NamedTuple{Symbol.(tuple(keys...))}(values)
@test nt == (a="1", b="2")

@test NamedTuple{(:a,:b), Tuple{Int, NamedTuple{(:c,)}}}((a=1, b=(c=1,))) == (a=1, b=(c=1,))

f(; kwargs...) = kwargs
@test f(; a=2, b=3) == f(; :a=>2, :b=>3)
@test  (; a=2, b=3) ==  (; :a=>2, :b=>3)
@test (; f(; a=2, b=3)...) == (; a=2, b=3) == (a=2, b=3)

name = "a"
@test NamedTuple{(Symbol(name),)}(2) == (a=2,)

@test NamedTuple{(), Tuple{}}((;)) == (;)

@test (;:).:(:)     === (:)
@test (;*).:*       === *
@test (;<:).:<:     === <:
@test (;<:, >:).:>: === >:
@test (;===).:(===) === ===
@test (;~,!,%,^,&,*,-,+,==,|,\,:,<,>,/) == (~ = ~, ! = !, % = rem, ^ = ^, (&) = &, * = *, - = -, + = +, == = ==, | = |, \ = \, (:) = Colon(), < = <, > = >, / = /)

end # module test_julia_namedtuples
