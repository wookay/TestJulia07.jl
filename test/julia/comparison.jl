module test_julia_comparison

using Test

struct C
    one
    two
end

struct B
    cs::Vector{C}
end

struct A
    bs::Vector{B}
end

# for typ in (A, B)
#     @eval function Base.:(==)(l::T, r::T) where {T <: $typ}
#         for name in fieldnames(T)
#             getfield(l, name) != getfield(r, name) && return false
#         end
#         return true
#     end
# end

function Base.:(==)(l::T, r::T) where {T <: B}
    return l.cs == r.cs
end

function Base.:(==)(l::T, r::T) where {T <: A}
    return l.bs == r.bs
end


x = [A([B([C(1, 2)])])]
y = [A([B([C(1, 2)])])]
z = [A([B([C(5, 6)])])]

@test x == y
@test y != z

end # module test_julia_comparison
