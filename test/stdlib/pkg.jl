module test_stdlib_pkg

using Test
using Pkg
using LibGit2

pkg = Base.identify_package(Pkg, "Pkg")
@test pkg.uuid == Base.UUID("44cfe95a-1eb2-52ea-b672-e2afdf69b78f")

if VERSION >= v"1.4"
    deps = Pkg.dependencies()
    uuid = Base.UUID("76f85450-5226-5b5a-8eaa-529ad045b433") # LibGit2
    @test deps[uuid].version isa VersionNumber
end

end # module test_stdlib_pkg
