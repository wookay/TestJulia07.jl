module test_julia_typealiases

using Test

struct G
end

const GVec = Vector{G}

if VERSION >= v"1.2"
    @test sprint(show, GVec([G()])) == "Main.test_julia_typealiases.G[Main.test_julia_typealiases.G()]"
else
    @test sprint(show, GVec([G()])) == "Main.test_julia_typealiases.G[G()]"
end

function Base.show(io::IO, v::GVec)
    print(io, "GVec", '(')
    Base.show_delim_array(io, v, '[', ",", ']', false)
    print(io, ')')
end

if VERSION >= v"1.2"
    @test sprint(show, GVec([G()])) == "GVec([Main.test_julia_typealiases.G()])"
else
    @test sprint(show, GVec([G()])) == "GVec([G()])"
end

end # module test_julia_typealiases
