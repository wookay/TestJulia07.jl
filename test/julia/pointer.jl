module test_julia_pointer1

using Test

struct D
end

struct G
    ptr_d::Ptr{D}
    val
end

d = D()
refd = Ref(d)
ptr_d = pointer_from_objref(refd)
g = G(ptr_d, 3)
refg = Ref(g)
p = Ptr{Base.RefValue{G}}(pointer_from_objref(refg))
refg2 = unsafe_load(p)

@test refg2[].ptr_d == ptr_d
@test refg2[].val == g.val

struct E
end

struct H
    ptr_d::Ptr{D}
    val
    ptr_e::Ptr{E}
end

e = E()
refe = Ref(e)
ptr_e = pointer_from_objref(refe)
h = H(ptr_d, 3, ptr_e)
refh = Ref(h)
p2 = Ptr{Base.RefValue{G}}(pointer_from_objref(refh))
refh2 = unsafe_load(p2)
@test refh2[].ptr_d == ptr_d
@test refh2[].val == h.val
# @test refh2[].ptr_e == ptr_e

end # module test_julia_pointer1


module test_julia_pointer2

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
@test unsafe_pointer_to_objref(p) == x
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
@test fa isa Ptr{Cvoid}

# @cfunction(\$callable, ReturnType, (ArgumentTypes...,)) -> CFunction
fb = @cfunction($foo, Int, (Int, Int))
fptr = Base.unsafe_convert(Ptr{Cvoid}, fb)
@test ccall(fptr, Int, (Int,Int), 1, 2) == 3
@test fb isa Base.CFunction

end # @testset "@cfunction"

# cfunction: closures are not supported on this platform
# f42() = 42
# fc = @cfunction $f42 Int ()
# fptr = Base.unsafe_convert(Ptr{Cvoid}, fc)
# @test ccall(fptr, Int, ()) == 42

@testset "GC.@preserve" begin
end # @testset "GC.@preserve"

end # module test_julia_pointer2


module test_julia_pointer3

using Test

p = Ptr{Cvoid}(UInt(0x03))
@test UInt32(UInt(p)) == 0x03

end # module test_julia_pointer3
