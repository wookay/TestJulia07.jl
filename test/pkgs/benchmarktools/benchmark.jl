module test_pkgs_benchmarktools_benchmark

using Test
using BenchmarkTools

@info :( @btime mapfoldl(abs, =>, (-1,-2,-3,-4)) )
@btime mapfoldl(abs, =>, (-1,-2,-3,-4))

end # module test_pkgs_benchmarktools_benchmark
