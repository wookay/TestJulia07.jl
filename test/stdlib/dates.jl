module test_julia_dates

using Test
using Dates # DateTime DateFormat DatePeriod TimePeriod year month day hour minute second

const RFC3339 = DateFormat("yyyy-mm-dd\\THH:MM:SSZ")

created_at = "2019-06-15T09:49:47Z"
dt = parse(DateTime, created_at, RFC3339)
@test Dates.format(dt, RFC3339) == created_at

@test year(dt) == 2019
@test month(dt) == 6
@test day(dt) == 15
@test hour(dt) == 9
@test minute(dt) == 49
@test second(dt) == 47

@test Year(2019) isa DatePeriod
@test Hour(10) isa TimePeriod

end # module test_julia_dates


using Jive
@If VERSION >= v"1.3" module test_julia_dates_am_pm

using Test
using Dates

df = DateFormat("u dd, yyyy HH:MM:SS p")

dt = parse(DateTime, "Dec 20, 2019 6:37:10 AM", df)
@test dt == DateTime(2019, 12, 20, 6, 37, 10)

dt = parse(DateTime, "Dec 20, 2019 6:37:10 PM", df)
@test dt == DateTime(2019, 12, 20, 18, 37, 10)

@test Dates.format(Time(Nanosecond(Minute(62))), "HH:MM") == "01:02"

end # @If VERSION >= v"1.3" module test_julia_dates_am_pm
