using Jive
@useinside Main module test_julia_typealiases

using Test

struct G
end

const GVec = Vector{G}
@test sprint(show, GVec([G()])) == "[G()]"

function Base.show(io::IO, v::GVec)
    print(io, "GVec", '(')
    Base.show_delim_array(io, v, '[', ",", ']', false)
    print(io, ')')
end
@test sprint(show, GVec([G()])) == "GVec([G()])"


using Jive # sprint_plain

const A = Vector{Int64}
@test sprint_plain(A) == "Vector{Int64} (alias for Array{Int64, 1})"

end # module test_julia_typealiases
