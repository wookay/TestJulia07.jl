module test_julia_typealiases

using Test

struct G
end

const GVec = Vector{G}

if VERSION >= v"1.4"
    @test endswith(sprint(show, GVec([G()])), ".test_julia_typealiases.G()]")
elseif VERSION >= v"1.3"
    @test endswith(sprint(show, GVec([G()])), ".test_julia_typealiases.G()]")
end

function Base.show(io::IO, v::GVec)
    print(io, "GVec", '(')
    Base.show_delim_array(io, v, '[', ",", ']', false)
    print(io, ')')
end

if VERSION >= v"1.2"
    @test endswith(sprint(show, GVec([G()])), ".test_julia_typealiases.G()])")
else
    @test sprint(show, GVec([G()])) == "GVec([G()])"
end


const A = Vector{Int64}
if VERSION >= v"1.6"
    @test sprint(io -> show(io, MIME"text/plain"(), A)) == "Vector{Int64} (alias for Array{Int64, 1})"
end

end # module test_julia_typealiases
