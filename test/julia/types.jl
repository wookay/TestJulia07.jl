module test_julia_types

using Test

@test Base.uniontypes(Int) == [Int]
@test Base.uniontypes(Union{Int,String}) == [Int,String]

@test typeof(Union{}) == Core.TypeofBottom
@test typeof(Union) == DataType
@test Union{Int} == Int

# https://docs.julialang.org/en/v1/devdocs/types/
TV, NV = TypeVar(:T), TypeVar(:N)
@test string(Array{TV,NV}) == "Array{T,N}"

@test (T where T) === Any

end # module test_julia_types
