#using Jive
#@useinside module test_pkgs_flux_optimise
module test_pkgs_flux_optimise

using Test
using Flux
using .Flux.Tracker # param
using .Flux.Optimise

w = [
    0.682548  0.307756  0.258107
    0.298242  0.231995  0.298551
    0.403919  0.72946   0.565001]

w′ = param([
    -0.33427    1.30884   -0.379262
    1.28972   -0.740618   1.30443
    -0.244732  -0.450543   0.503727])

@test Tracker.TrackedReal(0.8000038000134445) == Flux.mse(w, w′)
@test iszero(w′.grad)

loss(x) = Flux.mse(w*x, w′*x)

for opt in (ADAGrad(), Descent(), ADAM())
    # ADAGrad(η = 0.1)
    # Descent(η = 0.1)
    # ADAM(η = 0.001, β = (0.9, 0.999))
    # @info opt.eta # η

    l = loss(rand(3, 3))
    Flux.back!(l)
    @test !iszero(w′.grad)
    delta = Optimise.update!(opt, w′.data, w′.grad)
    w′.data .-= delta

    l = loss(rand(3, 3))
    Flux.back!(l)
    delta = Optimise.update!(opt, w′.data, w′.grad)
    w′.data .-= delta

    @test Tracker.TrackedReal(0.8000038000134445) > Flux.mse(w, w′)
end

end # module test_pkgs_flux_optimise
