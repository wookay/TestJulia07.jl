using Jive

@skip module test_pkgs_juliadb_table

using Test
using JuliaDB
using Statistics

t = table([1, 2, 3], [3, 4, 5], names=[:x, :y])
@test select(t, :y) == [3,4,5]
@test select(t, 2) == [3,4,5]

@test mean(select(t, :y)) == 4.0
@test groupby(mean, t, select=:y) == (mean = 4.0,)
@test groupby(mean, t, :x, select=:y) == table([1, 2, 3], [3.0, 4.0, 5.0], names=[:x, :mean])

end # module test_pkgs_juliadb_table
