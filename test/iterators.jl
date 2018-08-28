module test_iterators

using Test

struct A
end

function Base.iterate(::A)
    (:value, :next_state)
end

function Base.iterate(::A, state)
    nothing
end

a = A()
stack = []
for x in a
    push!(stack, x)
end
@test [:value] == stack

function Base.length(::A)
    2
end
vals = collect(a)
@test :value == vals[1]
@test_throws UndefRefError vals[2]

abstract type AbstractT{V} end

struct T{V, A} <: AbstractT{V}
    data::Vector{V}
    T(data::A) where {A} = new{eltype(A), A}(data)
end

@test T([1, 2, 3]) isa T{Int,Vector{Int}}
@test T(['a']) isa T{Char,Vector{Char}}

end # module test_iterators
