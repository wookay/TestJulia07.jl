module test_stdlib_random

using Test
using Random: Sampler, MersenneTwister

@test rand(Sampler(MersenneTwister, 1:10)) <= 10

end # module test_stdlib_random
