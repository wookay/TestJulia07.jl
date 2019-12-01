module test_stdlib_test

using Test # @test @inferred

f() = rand() > .5 ? 0 : 0.

@test Base.return_types(f, ()) == [Union{Float64, Int}]
@test_throws ErrorException @inferred(f())
@test_skip 1 == 2+3

@testset "one" begin
    @test true
    @testset "two" begin
        @test true
    end
end

@test length(GenericString("a")) == 1

end # module test_stdlib_test
