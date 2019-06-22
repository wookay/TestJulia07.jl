module test_pkgs_temporal

using Test
using Temporal
using Dates: Date, Month

ta = TS([10, 20], [Date(2018, 12, 31), Date(2019, 1, 1)])
@test ta isa TS
@test 1 .+ ta == [11  21;]'

@test ta.index == [Date(2018, 12, 31), Date(2019, 1, 1)]
@test ta.index .- Month(1) == [Date(2018, 11, 30), Date(2018, 12, 1)]

ta2018 = TS([10], [Date(2018, 12, 31)])
ta2019 = TS([20], [Date(2019, 1, 1)])

@test ta["2018"] == ta2018
@test ta["2018-12"] == ta2018
@test vcat(ta2018, ta2019) == ta

@test mondays(ta) == ta2018
@test bom(ta) == ta2019 # beginnings of the months
@test eom(ta) == ta2018 # ends of the months

end # module test_pkgs_temporal
