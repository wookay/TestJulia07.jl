module test_multiple_dispatch

using Test

f(::Int) = 2
f(::String) = "s"

@test length(methods(f)) == 2

m = first(methods(f, [String]))
Base.delete_method(m)

@test length(methods(f)) == 1

end # module test_multiple_dispatch
