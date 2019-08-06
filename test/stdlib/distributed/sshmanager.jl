using Jive
@useinside module test_stdlib_distributed_sshmanager

using Test
using Distributed
using .Distributed: SSHManager

const test_exeflags = Base.julia_cmd()
const test_exename = popfirst!(test_exeflags.exec)

function addprocs_with_testenv(manager; kwargs...)
    tunnel = false
    sshflags = ``
    max_parallel = 10
    pids = addprocs(manager; exename=test_exename, exeflags=test_exeflags, tunnel=tunnel, sshflags=sshflags, max_parallel=max_parallel, kwargs...)
    pids
end

curr_ws = workers()

machines = [("localhost", 2)]
manager = SSHManager(machines)
ws = try
    addprocs_with_testenv(manager)
catch err
    @test err isa CompositeException
    []
end

using .Distributed: Worker, MsgHeader, CallMsg, send_msg
function myremotecall(f, w::Worker, args...; kwargs...)
    rr = Future(w)
    send_msg(w, MsgHeader(remoteref_id(rr)), CallMsg{:call}(f, args, kwargs))
    return rr
end

@test Distributed.PGRP.workers[1] isa Distributed.LocalProcess

if !isempty(ws)
    wid = first(ws)
    w = Distributed.worker_from_id(wid)
    @test wid == worker_id_from_socket(w.w_stream)
    @test wid == worker_id_from_socket(w.r_stream)
    @test Distributed.map_sock_wrkr[w.r_stream] === w
    @test (fetch ∘ myremotecall)(() -> myid(), w) == wid
end

end # module test_stdlib_distributed_sshmanager
