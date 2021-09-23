module test_stdlib_random

using Test
using Random: Random, Sampler, MersenneTwister

const rand_nums = let
    if VERSION >= v"1.8.0-DEV.575"
        [5, 1]
    else
        [5, 8]
    end
end


Random.seed!(0)
@test rand(Sampler(MersenneTwister, 1:10)) == rand_nums[1]
@test rand(Sampler(MersenneTwister, 1:10)) == rand_nums[2]

Random.seed!(0)
@test rand(Sampler(MersenneTwister, 1:10)) == rand_nums[1]
@test rand(Sampler(MersenneTwister, 1:10)) == rand_nums[2]

end # module test_stdlib_random
