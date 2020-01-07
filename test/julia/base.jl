module test_julia_base

M = Base.require(Main, :Test)
using .M

@test true

end # module test_julia_base
