module test_julia_iterate_counter

using Test

mutable struct G
     counter
end

function Base.iterate(g::G)
    (g.counter, 1)
end

function Base.iterate(g::G, val)
    if g.counter > 2
        return nothing
    end
    g.counter += val
    (g.counter, 1)
end

g = G(0)
for x in g
end
@test g.counter == 3

end # module test_julia_iterate_counter


module test_julia_iterate_basic

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

end # module test_julia_iterate_basic


module test_julia_iterate_dict

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

end # module test_julia_iterate_dict
