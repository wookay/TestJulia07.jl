module test_julia_modules1

using Test

module B
export c, d
f() = 2
end

@test [:B, :c, :d] == names(B)
@test test_julia_modules1 === parentmodule(B)
@test B === parentmodule(B.f)
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


module test_julia_loaded_modules

pkg = Base.PkgId(Base.UUID("8dfed614-e22c-5e08-85e1-65c5234f0b40"), "Test")
loaded = Base.loaded_modules[pkg]
using .loaded

@test loaded === Test

end # module test_julia_loaded_modules


module test_julia_modules_macro

using Test

macro m()
    __module__
end

@test (@__MODULE__) == (@m) == test_julia_modules_macro

end # module test_julia_modules_macro


module test_julia_anonymous_module

using Test

m = Module()
@test m isa Module
@test nameof(m) === :anonymous
@test names(m, all=true, imported=true) == [:anonymous]

GC.@preserve m begin
    f = Base.eval(m, (x) -> 2x)
    @test f(3) == 6
end

end # module test_julia_anonymous_module


module test_julia_plus

using Test

module M
    + = 3
end

@test (+) !== (M.:+)

end # module test_julia_plus


module test_julia_baremodule

baremodule B
end

using Test

@test !isdefined(B, :Base)
@test isdefined(B, :Core)

end # module test_julia_baremodule
