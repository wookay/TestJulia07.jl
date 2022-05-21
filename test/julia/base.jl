module test_julia_base

M = Base.require(Main, :Test)
using .M

@test true

@test basename(Base.active_project()) == "Project.toml"

pkgid = Base.identify_package("Pkg")
@test pkgid.uuid isa Base.UUID
@test pkgid.name == "Pkg"
loc = Base.locate_package(pkgid)
if loc !== nothing
    @test basename(loc) == "Pkg.jl"
end

end # module test_julia_base
