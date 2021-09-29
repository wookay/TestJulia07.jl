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

str(a; b="$a") = b
@test str(42) == "42"

@test str(42; b=3) == 3

b = 3
@test str(42; b) == 3

h(; kwargs...) = kwargs
@test (; h(a=1, b="")...).a == 1

end # module test_julia_functions


module test_julia_functions_return

using Test

function f()
    a::Float32 = 1
    a
end

function g()
    a::Float32 = 0.0
    a = 1
    a
end

function h()
    a::Float32 = 1
end

@test f() isa Float32
@test g() isa Float32
@test h() isa Int

end # module test_julia_functions_return


module test_julia_functions_inner

using Test

function f(val=true)
    function g()
        val = false
    end
    g()
    val
end

@test f() == false

end # module test_julia_functions_inner


module test_julia_functions_anonymous

using Test

@test (() -> 1)()   == 1
@test ((x) -> x)(1) == 1

end # module test_julia_functions_anonymous


module test_julia_functions_propertynames

using Test

function builder()
    n = 1
    f() = n + 1
end

g = builder()
@test propertynames(g) == (:n,)
@test g.n == 1

end # module test_julia_functions_propertynames
