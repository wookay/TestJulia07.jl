module test_pkgs_cassette

using Test
using Cassette
using Cassette: @context, overdub

@context InferCtx

relu(x) = max(zero(x), x)
relulayer(W, x, b) = relu.(W*x .+ b)
@test relulayer(1, 2, 3) == 5

function Cassette.prehook(ctx::InferCtx, f, args...)
    if f in (relu, relulayer)
        push!(ctx.metadata, (:prehook, f, args))
    end
end

ctx = InferCtx(metadata=Any[])
overdub(ctx, relulayer, 1, 2, 3)

@test ctx.metadata == [(:prehook, relu, (5,))]

end # module test_pkgs_cassette
