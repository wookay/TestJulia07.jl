using Test

@test something(nothing, 1) == 1
@test sum([missing, 1]) === missing
@test sum(skipmissing([missing, 1])) == 1
