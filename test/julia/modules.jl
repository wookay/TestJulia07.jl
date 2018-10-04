module test_modules

using Test

module B
export c, d
end

@test [:B, :c, :d] == names(B)
@test test_modules === parentmodule(B)
@test (:Main, :test_modules, :B) == fullname(B)
@test :B == nameof(B)
@test Base.isexported(B, :c)

@test Core === parentmodule(Int)
@test @isdefined B
@test !@isdefined Meh
@test isdefined(@__MODULE__, :B)

@test length(Base.loaded_modules) >= 33

end
