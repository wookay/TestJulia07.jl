module test_stdlib_pkg

using Test
using Pkg

pkg = Base.identify_package(Pkg, "Pkg")
@test pkg.uuid == Base.UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f")

if VERSION >= v"1.7"
    deps = Pkg.dependencies()
    @test !isempty(deps)
    # @test deps[uuid].version isa VersionNumber
end

end # module test_stdlib_pkg
