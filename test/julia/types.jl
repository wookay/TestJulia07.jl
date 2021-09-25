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
@test Union{} === Base.Bottom
@test Base.Bottom isa Core.TypeofBottom
@test typeof(==) === typeof(==)
@test Union{Int,Int} === Union{Int} === Int
@test typeintersect(Int, Bool) === Union{}

@test typeof(Vector{}) === typeof(Vector) === UnionAll
@test Float64 isa Type{Float64}

# https://docs.julialang.org/en/v1/devdocs/types/
TV, NV = TypeVar(:T), TypeVar(:N)
if VERSION >= v"1.6.0-DEV.849"
    @test string(Array{TV,NV}) == "Array{T, N}"
end

@test Any === (T where T) === (Int where Int) === (where where where)
@test (+)::typeof(+) === +

end # module test_julia_types


module test_julia_datatype

using Test
using InteractiveUtils # subtypes

@test typeintersect(DataType, Type) === DataType

@test supertype(DataType) === Type.body
@test subtypes(DataType) == []

@test Type <: Type
@test Type{Int} <: Type
@test Type{<:Integer} <: Type
@test Type{Int} <: Type{<:Integer}
@test Type{Signed} <: Type{<:Integer}
@test !(Int <: Type{<:Integer})

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

@test Base.uniontypes(Union{Int, String}) == [Int, String]

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


module test_julia_types_struct

using Test
using ..test_julia_types_param

struct A
    a::test_julia_types_param.OK
end

struct B
    f::typeof(push!)
end

@test B(push!).f === push!

end # module test_julia_types_struct


module test_julia_types_isstructtype

using Test

@test !isstructtype(Int)
@test isstructtype(Vector)

end # module test_julia_types_isstructtype


module test_julia_types_subtyping

using Test

abstract type AbstractT end

const AT = AbstractT

struct ConcretT <: AT
end

@test supertype(ConcretT) === AbstractT
@test supertype(typeof(ConcretT())) === AbstractT

end # module test_julia_types_subtyping
