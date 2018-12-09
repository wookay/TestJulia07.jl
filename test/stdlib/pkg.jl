module test_stdlib_pkg

using Test
using Pkg
using UUIDs

pkg = Base.identify_package(Pkg, "Pkg")
@test pkg.uuid == UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f")

ctx = Pkg.Types.Context()
kv = first(filter(kv -> kv.second=="Pkg", ctx.stdlibs))
@test kv.first == UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f")
spec = PackageSpec(kv.second, kv.first)
pkgdir = Base.locate_package(Base.PkgId(spec.uuid, spec.name))
@test basename(pkgdir) == "Pkg.jl"
@test isfile(normpath(pkgdir, "..", "..", "Project.toml"))

@test basename(ctx.env.manifest_file) == "Manifest.toml"

end # module test_stdlib_pkg
