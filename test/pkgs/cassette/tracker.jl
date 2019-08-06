module test_pkgs_cassette_tracker

using Test
using Jive # @skip
using Tracker
using Flux
using Cassette
using .Cassette: @context, overdub

w = [
    0.682548  0.307756  0.258107
    0.298242  0.231995  0.298551
    0.403919  0.72946   0.565001]

w′ = [
    -0.33427    1.30884   -0.379262
    1.28972   -0.740618   1.30443
    -0.244732  -0.450543   0.503727]

loss(x) = Flux.mse(w*x, w′*x)
opt = ADAGrad() # η = 0.1

l = loss(rand(3, 3))

@context InferCtx
Cassette.overdub(::InferCtx, f::typeof(invoke), args...) = f(args...)

@skip function Cassette.prehook(ctx::InferCtx, a, f, args...)
    if a == Core.arrayset
        push!(ctx.metadata, (hook=:pre, copy=copy(args[2]),))
    end
end

function Cassette.posthook(ctx::InferCtx, a, f, args...)
    if f === setindex!
        push!(ctx.metadata, (hook=:post, copy=copy(a),))
    end
end

ctx = InferCtx(metadata=Any[])
@test isempty(ctx.metadata)

end # module test_pkgs_cassette_tracker
