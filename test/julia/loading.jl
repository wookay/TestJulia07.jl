module test_julia_loading

using Test

include_string(Main, "a=2", "a.jl")
@test Main.a == 2

end # module test_julia_loading
