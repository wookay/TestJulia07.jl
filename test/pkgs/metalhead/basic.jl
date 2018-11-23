module test_pkgs_metalhead_basic

using Test

code = quote

using Metalhead
@test Metalhead.classify isa Function
# vgg = VGG19()
# @test vgg.layers isa Metalhead.Flux.Chain

end # code

if isdefined(Main, :skipped_tests) && Main.skipped_tests[:pass]
    push!(Main.skipped_tests[:list], nameof(@__MODULE__))
else
    using Dates
    t = now()
    eval(code)
    printstyled(nameof(@__MODULE__), " elapsed ", round(now() - t, Second), ".\n", color=:cyan)
end

end # module test_pkgs_metalhead_basic
