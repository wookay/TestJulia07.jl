module test_observables

using Observables
using Test

r = Observable(0)

history = []
f = on(r) do x
    push!(history, (on, r, x))
end

r[] = 2
@test history == [(on, r, 2)]
@test r.listeners == [f.f]

off(r, f)

r[] = 3
@test history == [(on, r, 2)]
@test r.listeners == []

end # module test_observables
