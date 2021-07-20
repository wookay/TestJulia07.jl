module test_julia_inferred

using Test

function f1(a::Bool)
    Any[a ? 1 : 1.0]
end

function f2(a::Bool)::Vector{Any}
       [a ? 1 : 1.0]
end

function f3(a::Bool)
       [a ? 1 : 1.0]
end

                       @inferred(f1(true))
                       @inferred(f2(true))
@test_throws Exception @inferred(f3(true))

end # module test_julia_inferred
