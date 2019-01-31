module test_julia_pointer

using Test

@testset "Ptr{T} Ref{T}" begin
@test C_NULL isa Ptr{Cvoid}

ref = Ref(3)
@test ref[] == 3
end # @testset "Ptr{T} Ref{T}"


@testset "pointer" begin
# pointer(array [, index])
@test pointer([1,2,3]) isa Ptr{Int}
@test pointer([0xff, 0x00]) isa Ptr{UInt8}
end # @testset "pointer"


@testset "pointer_from_objref unsafe_pointer_to_objref" begin
x = [1,2,3]
p = pointer_from_objref(x)
@test unsafe_pointer_to_objref(p::Ptr) == x
end # @testset "pointer_from_objref unsafe_pointer_to_objref"


@testset "unsafe_load unsafe_store!" begin
# unsafe_load(p::Ptr{T}, i::Integer=1)
# unsafe_store!(p::Ptr{T}, x, i::Integer=1)
# julia test/core.jl - pull request 1270
a = [11,12,13]
p = pointer(a)
@test unsafe_load(p, 1) == 11
unsafe_store!(p, 99, 2)
@test a == [11,99,13]
end # @testset "unsafe_load unsafe_store!"


@testset "unsafe_wrap" begin
# unsafe_wrap(Array, pointer::Ptr{T}, dims; own = false)
a = [1,2,3]
@test unsafe_wrap(Array, pointer(a), length(a)) == a
end # @testset "unsafe_wrap"


foo(x::Int, y::Int) = x + y
@testset "@cfunction Base.unsafe_convert" begin
# @cfunction(callable, ReturnType, (ArgumentTypes...,)) -> Ptr{Cvoid}
fa = @cfunction(foo, Int, (Int, Int))
@test ccall(fa, Int, (Int,Int), 1, 2) == 3

# @cfunction(\$callable, ReturnType, (ArgumentTypes...,)) -> CFunction
fb = @cfunction($foo, Int, (Int, Int))
@test ccall(Base.unsafe_convert(Ptr{Cvoid}, fb), Int, (Int,Int), 1, 2) == 3
end # @testset "@cfunction"


@testset "GC.@preserve" begin
f() = 42
cf = @cfunction $f Int ()
GC.@preserve cf begin
    fptr = Base.unsafe_convert(Ptr{Cvoid}, cf)
    b = ccall(fptr, Int, ())
end
@test b == 42
end # @testset "GC.@preserve"

end # module test_julia_pointer
