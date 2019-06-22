module test_pkgs_intervalsets_dates

using Test
using IntervalSets
using Dates

@test Date(2018,12,31) in Date(2019, 1,1) ± Day(1)

end # module test_pkgs_intervalsets_dates
