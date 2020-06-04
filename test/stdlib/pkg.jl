module test_stdlib_pkg

using Test
using Pkg
using UUIDs

pkg = Base.identify_package(Pkg, "Pkg")
@test pkg.uuid == UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f")

end # module test_stdlib_pkg
