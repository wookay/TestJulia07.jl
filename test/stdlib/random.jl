module test_stdlib_random

using Test
using Random: Random, Sampler, MersenneTwister

Random.seed!(0)
@test rand(Sampler(MersenneTwister, 1:10)) < 10

end # module test_stdlib_random
