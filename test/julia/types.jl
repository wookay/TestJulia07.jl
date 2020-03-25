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


module test_julia_types_tuple

using Test

@test Tuple{Int,Int} <: Tuple
@test Tuple{Int,Int} <: Tuple{T,T} where T
@test !(Tuple{Real,Real} <: Tuple{T,T} where T) # diagonal variables
@test Tuple{Real} <: Tuple{T} where T # not diagonal
@test Tuple{Int,Int} <: (Tuple{T,T} where T) <: Tuple
@test NTuple{2,Int} <: Tuple{T,T} where T
@test NTuple{2,Int} <: Tuple{T,T} where T
@test !(Tuple{Int,String} <: Tuple{T,T} where T)

@test (Tuple{T} where T) <: Tuple{Vararg{T} where T}
@test (Tuple{T,T} where T) <: Tuple{Vararg{T}} where T
@test Tuple{Int,String} <: Tuple{Vararg{T} where T}

f(x::T, y::T) where {T} = 0
@test methods(f, Tuple{T,T} where T).mt.name === :f

end # module test_julia_types_tuple


module test_julia_types_union

using Test

f(x::Int, y::Int) = :int
f(x::Union{Int,String}, y::Union{Int,String}) = :union

@test f(1, 2) === :int
@test f(1, "") === :union

@test ((+)::typeof(+))(1, 2) == 3

end # module test_julia_types_union


module test_julia_types_param

using Test

abstract type Result end

struct OK <: Result
    result
end

struct Fail <: Result
    result
end

struct A{S}
end

f(::A{:a}) = OK(:a)
f(::A{:b}) = OK(:b)

@test f(A{:a}()) == OK(:a)
@test f(A{:b}()) == OK(:b)

f(::A{X}) where X = Fail(X)

@test f(A{:c}()) == Fail(:c)

end # module test_julia_types_param
