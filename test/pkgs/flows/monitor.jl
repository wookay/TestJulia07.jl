module test_pkgs_flows_monitor

using Test
using Flows

m = Monitor([1.0], x->x[1]^2)
@test times(m) == Float64[]
@test samples(m) == Float64[]

push!(m, 0.0, [0.0])
push!(m, 0.1, [1.0])
@test times(m) == [0, 0.1]
@test samples(m) == [0, 1]

reset!(m)
@test isempty(times(m))
@test isempty(samples(m))

end # module test_pkgs_flows_monitor
