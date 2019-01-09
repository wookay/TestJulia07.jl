module test_julia_modules1

using Test

module B
export c, d
end

@test [:B, :c, :d] == names(B)
@test test_julia_modules1 === parentmodule(B)
@test (:Main, :test_julia_modules1, :B) == fullname(B)
@test :B == nameof(B)
@test Base.isexported(B, :c)

@test Core === parentmodule(Int)
@test @isdefined B
@test !@isdefined Meh
@test isdefined(@__MODULE__, :B)

@test length(Base.loaded_modules) >= 33

end # module test_julia_modules1


module test_julia_modules2

using Test

module A
f(a::T) where T<:AbstractArray = 2
end # test_julia_modules2.A

module B
struct MyArray <: AbstractArray{Int,1}
end
Base.size(::MyArray) = 0
end # test_julia_modules2.B

using .A: f
using .B: MyArray

@test f(MyArray()) == 2

end # module test_julia_modules2


module test_julia_modules3

global a = 2

module A
global a = 3
end

using Test
@test a == 2

using .A
@test a == 2

end # module test_julia_modules3


module test_julia_modules4

using Test
m = Base.require(Base.PkgId(
                     Base.UUID((0x37e2e46d_f89d_539d,0xb4ee_838fcccc9c8e)), "LinearAlgebra"))
@test m isa Module

end # module test_julia_modules4
