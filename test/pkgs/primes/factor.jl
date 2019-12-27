module test_pkgs_primes_factor

using Test
using Primes

@test collect(factor(28)) == [2=>2, 7=>1]

end # module test_pkgs_primes_factor
