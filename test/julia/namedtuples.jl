module test_julia_namedtuples

using Test

@test NamedTuple{(), Tuple{}}((;)) == NamedTuple{}() == NamedTuple() == (;)
@test_throws MethodError NamedTuple{(), Tuple{}}()
@test (;) isa NamedTuple
@test (;) isa NamedTuple{(), Tuple{}}

@test (a=1, b=2) == (a=1, :b=>2)
@test (b=2,) == (; b=2) == (; :b=>2)

b = 2
@test (; b) == (b=2,)

@test NamedTuple{(:a, :b),Tuple{Int,Int}}((1, 2)) == NamedTuple{(:a, :b)}((1, 2)) == (a=1, b=2)

d = Dict(:a=>1, :b=>2)
@test (; d...) == (a=1, b=2)
@test d == Dict(pairs((a=1, b=2)))

e = (; b, a) = (a=1, b=2)
@test e == (a=1, b=2)
@test a == 1 && b == 2

nt = (a = 1, b = 2)
@test NamedTuple{keys(nt)}(values(nt)) == nt

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


module test_julia_namedtuples_structdiff

using Test

@test Base.structdiff((a=1, b=2), NamedTuple{(:a,)}) == (b=2,)
@test Base.structdiff((a=1, b=2), (a=1,))            == (b=2,)

end # module test_julia_namedtuples_structdiff
