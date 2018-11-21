module test_pkgs_distributions_uniform

using Test
using Distributions

u = Uniform(1, 2)
@test 1 < rand(u) < 2

@test u isa Distribution{Univariate}
@test u isa Distribution{Univariate, Continuous}

end # module test_pkgs_distributions_uniform
