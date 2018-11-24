using Jive # @skip
@skip module test_pkgs_metalhead_basic

using Test
using Metalhead
@test Metalhead.classify isa Function
# vgg = VGG19()
# @test vgg.layers isa Metalhead.Flux.Chain

end # module test_pkgs_metalhead_basic
