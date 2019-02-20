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


module test_julia_datatype

using Test
using InteractiveUtils # subtypes

@test typeintersect(DataType, Type) === DataType

@test supertype(DataType) === Type.body
@test subtypes(DataType) == []

@test supertype(Type) === Any
@test subtypes(Type) == [Core.TypeofBottom, DataType, Union, UnionAll]

end # module test_julia_datatype


module test_julia_types_eltype

using Test

abstract type AbstractT{V} end

struct T{V, A} <: AbstractT{V}
    data::Vector{V}
    T(data::A) where {A} = new{eltype(A), A}(data)
end

@test T([1, 2, 3]) isa T{Int,Vector{Int}}
@test T(['a']) isa T{Char,Vector{Char}}

end # module test_julia_types_eltype
