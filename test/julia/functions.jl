module test_julia_functions

using Test

struct G
    a
end

f(g::G, c=g.a) = c 
@test f(G(2)) == 2

g(;a) = a+1
@test invoke(Core.kwfunc(g), Tuple{NamedTuple{(:a,), Tuple{Int}}, typeof(g)}, (a=2,), g) == 3


function execute(nts::Vector{<:NamedTuple})
    1
end

@test execute([(a=1, b=2)]) == 1
@test execute([(c=1, d=2)]) == 1

function execute(nts::Vector{<:NamedTuple{(:a,:b)}})
    2
end

@test execute([(a=1, b=2)]) == 2
@test execute([(c=1, d=2)]) == 1

end # module test_julia_functions
