module test_julia_generated

using Test

generated_arg_types = []
non_generated_args = []

function f(x)
    if @generated
        push!(generated_arg_types, x)
        :x
    else
        push!(non_generated_args, x)
        0
    end
end

f(1)
@test generated_arg_types == [Int]
f("")
@test generated_arg_types == [Int, String]
f(2)
@test generated_arg_types == [Int, String]

# https://discourse.julialang.org/t/testing-function-with-if-generated/17823/8
function _invoke(f, x...; generated)
    ci = code_lowered(f, Core.Typeof(x); generated)[1]
    g = @eval @generated function g($([gensym() for _ in x]...))
        return $(QuoteNode(ci))
    end
    Base.invokelatest(g, x...)
end

_invoke(f, 1; generated=false)
@test non_generated_args == [1]

end # module test_julia_generated
