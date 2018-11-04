module test_pkgs_distributions

using Test
using Distributions

u = Uniform(1, 2)
@test 1 < rand(u) < 2

end # module test_pkgs_distributions
