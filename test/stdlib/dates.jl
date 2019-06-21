module test_julia_dates

using Test
using Dates # DateTime DateFormat DatePeriod TimePeriod year month day hour minute second

created_at = "2019-06-15T09:49:47Z"
dt = parse(DateTime, created_at, DateFormat("yyyy-mm-dd\\THH:MM:SSZ"))

@test year(dt) == 2019
@test month(dt) == 6
@test day(dt) == 15
@test hour(dt) == 9
@test minute(dt) == 49
@test second(dt) == 47

@test Year(2019) isa DatePeriod
@test Hour(10) isa TimePeriod

end # module test_julia_dates
