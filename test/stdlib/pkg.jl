module test_stdlib_pkg

using Test
using Pkg

pkg = Base.identify_package(Pkg, "Pkg")
@test pkg.uuid == Base.UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f")

if VERSION >= v"1.4"
    deps = Pkg.dependencies()
    uuid = Base.UUID("8dfed614-e22c-5e08-85e1-65c5234f0b40") # Test
    @test deps[uuid].version isa VersionNumber
end

end # module test_stdlib_pkg
