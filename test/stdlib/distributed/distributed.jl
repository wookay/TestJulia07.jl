module test_stdlib_distributed

using Test
using Distributed

@test nprocs() >= 1
@test nworkers() >= 1

if myid() == 1
    @test workers() ⊆ procs()
    ws = addprocs(2)
    @test ws ⊆ workers()
    @test nprocs() == nworkers() + 1

    id = workers()[1]
    f = Future(id)
    put!(f, :OK)
    @test id > 1
    @test fetch(f) == :OK

    t = rmprocs(ws)
    wait(t)

    @test nprocs() >= 1
    @test nworkers() >= 1
end

end # module test_stdlib_distributed
