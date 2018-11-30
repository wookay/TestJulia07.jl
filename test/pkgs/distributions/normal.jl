module test_pkgs_distributions_normal

using Test
using Distributions

d = Normal(0, 1)
@test mean(d) == 0

@test d isa Distribution{Univariate}
@test d isa Distribution{Univariate, Continuous}

@test sum(pdf.(d, -6:6)) ≈ 1

@test 0 == quantile(d, 0.5)
medianinterval(d, p = 0.95) = (quantile(d, 1-(1+p)/2), quantile(d, (1+p)/2))
@test (all∘identity)(isapprox.(medianinterval(d), (-1.9599639845400576, 1.9599639845400576)))

end # module test_pkgs_distributions_normal
