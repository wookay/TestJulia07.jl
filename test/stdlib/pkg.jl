module test_stdlib_pkg

using Test
using Pkg
using UUIDs

pkg = Base.identify_package(Pkg, "Pkg")
@test pkg.uuid == UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f")

deps = Pkg.dependencies()
uuid = Base.UUID("ba5e3d4b-8524-549f-bc71-e76ad9e9deed") # Jive
@test deps[uuid].version isa VersionNumber

end # module test_stdlib_pkg
