module test_julia_iterators_iterate

using Test

struct A
end

function Base.iterate(::A)
    (:value, :next_state)
end

entered = []
function Base.iterate(::A, state)
    push!(entered, state)
    nothing
end

a = A()
stack = []
for x in a
    push!(stack, x)
end
@test [:value] == stack
@test [:next_state] == entered

function Base.length(::A)
    2
end
vals = collect(a)
@test :value == vals[1]
@test_throws UndefRefError vals[2]

end # module test_julia_iterators_iterate


module test_julia_iterators_iterate_dict

using Test

struct G
    d::Dict
end

struct V
    val
end

function Base.iterate(g::G, state=firstindex(g.d.vals))
    y = iterate(g.d, state)
    y === nothing && return nothing
    (V(y[1]), y[2])
end

g = G(Dict(:a => 1))
@test first(g) == V(:a => 1)

end # module test_julia_iterators_iterate_dict


module test_julia_iterators_peel

using Test

(a, rest) = Iterators.peel("abc")
@test a == 'a'
@test collect(rest) == ['b', 'c']

@test collect(Iterators.product((1,2), (3,4))) == [(1, 3) (1, 4);  (2, 3)  (2, 4)]

end # module test_julia_iterators_peel


module test_julia_iterators_repeated

using Test
using Base.Iterators: repeated

@test collect(repeated((1,2), 3)) == [(1, 2), (1, 2), (1, 2)]

end # module test_julia_iterators_repeated
