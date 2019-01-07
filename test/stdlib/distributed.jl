module test_stdlib_distributed

using Test
using Distributed

@test nprocs() >= 1
@test nworkers() >= 1
@test workers() ⊆ procs()
@test myid() == 1

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

end # module test_stdlib_distributed
