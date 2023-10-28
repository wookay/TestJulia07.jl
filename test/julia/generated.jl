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

end # module test_julia_generated
