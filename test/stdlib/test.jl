module test_stdlib_test

using Test # @test @inferred

f() = rand() > .5 ? 0 : 0.

@test Base.return_types(f, ()) == [Union{Float64, Int}]
@test_throws ErrorException @inferred(f())

end # module test_stdlib_test
