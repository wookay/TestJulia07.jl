module test_julia_base

M = Base.require(Main, :Test)
using .M

@test true

@test basename(Base.active_project()) == "Project.toml"

pkgid = Base.identify_package("Pkg")
@info :pkgid pkgid
if pkgid === nothing
else
@test pkgid.uuid isa Base.UUID
@test pkgid.name == "Pkg"
@test basename(Base.locate_package(pkgid)) == "Pkg.jl"
end

end # module test_julia_base
