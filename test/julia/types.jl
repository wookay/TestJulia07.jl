module test_julia_types

using Test

@test Base.uniontypes(Int) == [Int]
@test Base.uniontypes(Union{Int,String}) == [Int,String]

@test typeof(Type{String}) === DataType
@test typeof(Type{<:AbstractString}) === UnionAll
@test typeof(String) === DataType
@test typeof(UnionAll) === DataType
@test typeof(Union) === DataType
@test typeof(Union{}) === Core.TypeofBottom
@test Union{Int,Int} === Union{Int} === Int
@test typeintersect(Int, Bool) === Union{} === Base.Bottom

# https://docs.julialang.org/en/v1/devdocs/types/
TV, NV = TypeVar(:T), TypeVar(:N)
@test string(Array{TV,NV}) == "Array{T,N}"

@test (T where T) === Any
@test (+)::typeof(+) === +

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


module test_julia_types_isimmutable

using Test

@test isimmutable(0)
@test isimmutable(pi)
@test isimmutable((2,))
@test isimmutable((a=2,))
@test isimmutable(:a=>2)
@test isimmutable(nothing)

# mutable types
@test !isimmutable(:abc)
@test !isimmutable("abc")
@test !isimmutable([])
@test !isimmutable(Dict())

mutable struct A
end
@test !isimmutable(A())

end # module test_julia_types_isimmutable
