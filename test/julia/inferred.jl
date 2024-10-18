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

function f4(a::Bool)
    a ? 1 : "hello"
end

                       @inferred(f1(true))
                       @inferred(f2(true))

# ERROR: LoadError: return type Vector{Int64} does not match inferred return type Union{Vector{Float64}, Vector{Int64}}
@test_throws Exception @inferred(f3(true))

# ERROR: LoadError: return type Int64 does not match inferred return type Union{Int64, String}
@test_throws Exception @inferred(f4(true))

end # module test_julia_inferred
