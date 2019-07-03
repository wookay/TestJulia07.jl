module test_julia_typealiases

using Test

struct G
end

const GVec = Vector{G}

@test sprint(show, GVec([G()])) == "Main.test_julia_typealiases.G[G()]"

function Base.show(io::IO, v::GVec)
    print(io, "GVec", '(')
    Base.show_delim_array(io, v, '[', ",", ']', false)
    print(io, ')')
end

@test sprint(show, GVec([G()])) == "GVec([G()])"

end # module test_julia_typealiases
