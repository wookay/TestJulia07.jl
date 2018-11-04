module test_julia_functions

using Test

struct G
    a
end

f(g::G, c=g.a) = c 
@test f(G(2)) == 2

g(;a) = a+1
@test invoke(Core.kwfunc(g), Tuple{NamedTuple{(:a,), Tuple{Int}}, typeof(g)}, (a=2,), g) == 3

end # module test_julia_functions
