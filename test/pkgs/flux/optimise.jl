using Jive
@useinside module test_pkgs_flux_optimise
#module test_pkgs_flux_optimise

using Test
using Flux
using .Flux.Optimise
using Tracker

w = [
    0.682548  0.307756  0.258107
    0.298242  0.231995  0.298551
    0.403919  0.72946   0.565001]

w′ = [
    -0.33427    1.30884   -0.379262
    1.28972   -0.740618   1.30443
    -0.244732  -0.450543   0.503727]

@test Tracker.TrackedReal(0.8000038000134445) ≈ Flux.mse(w, w′)

end # module test_pkgs_flux_optimise
