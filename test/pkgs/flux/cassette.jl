module test_pkgs_flux_cassette

using Test
using Flux
using Cassette
using Cassette: @context, overdub

@context InferCtx

Cassette.overdub(::InferCtx, f::typeof(invoke), args...) = f(args...)

function Cassette.prehook(ctx::InferCtx, f, args...)
    if f == Core.arrayset
        push!(ctx.metadata, (hook=:pre, copy=copy(args[2]),))
    end
end

function Cassette.posthook(ctx::InferCtx, f, args...)
    if f isa Array && first(args) == Core.arrayset
        push!(ctx.metadata, (hook=:post, copy=copy(args[3]),))
    end
end

d = Dense(5, 2) # in out σ=identity

ctx = InferCtx(metadata=Any[])
overdub(ctx, d, [1,2,3,4,5])

at2 = ctx.metadata[2]
at3 = ctx.metadata[3]

@test at2.hook == :post
@test at3.hook == :pre
@test filter(!isnan, at2.copy) == filter(!isnan, at3.copy)

end # module test_pkgs_flux_cassette
