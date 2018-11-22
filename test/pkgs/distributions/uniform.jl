module test_pkgs_distributions_uniform

using Test
using Distributions

d = Uniform(0, 1)
@test 0 < rand(d) < 1

@test d isa Distribution{Univariate}
@test d isa Distribution{Univariate, Continuous}

end # module test_pkgs_distributions_uniform
