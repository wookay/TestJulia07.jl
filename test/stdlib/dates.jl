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

@test dayname(dt) == dayname(dayofweek(dt)) == "Saturday"
@test join(dayname.(Dates.Mon:Dates.Sun), ", ") == "Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday"

@test length(January:December) == 12

end # module test_julia_dates
