module test_pkgs_distributions_normal

using Test
using Distributions

n = Normal(10, 2)
@test mean(n) == 10

@test n isa Distribution{Univariate}
@test n isa Distribution{Univariate, Continuous}

end # module test_pkgs_distributions_normal
