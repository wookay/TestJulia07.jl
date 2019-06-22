module test_pkgs_timeseries

using Test
using TimeSeries

ta = TimeArray((A=[10, 20], Index=[Date(2018, 12, 31), Date(2019, 1, 1)]); timestamp=:Index)
@test ta isa TimeArray
@test timestamp(ta) == [Date(2018, 12, 31), Date(2019, 1, 1)]
@test values(ta) == [10 20]'
@test values(1 .+ ta) == [11 21]'
@test colnames(ta) == [:A]
@test meta(ta) === nothing

ta2018 = TimeArray((A=[10], Index=[Date(2018, 12, 31)]); timestamp=:Index)
ta2019 = TimeArray((A=[20], Index=[Date(2019, 1, 1)]); timestamp=:Index)
@test head(ta, 1) == ta2018
@test tail(ta, 1) == ta2019
@test vcat(ta2018, ta2019) == ta

end # module test_pkgs_timeseries
