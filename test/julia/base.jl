module test_julia_base

M = Base.require(Main, :Test)
using .M

@test true

@test basename(Base.active_project()) == "Project.toml"

end # module test_julia_base
