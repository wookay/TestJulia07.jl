module test_julia_things

using Test

@test something(nothing, 1) == 1
@test something(nothing, Some(1)) == 1
@test_throws ArgumentError something(nothing)
@test sum([missing, 1]) === missing
@test sum(skipmissing([missing, 1])) == 1

@test nothing === Nothing()
@test missing === Missing()

@test_throws ArgumentError print(nothing)

end # module test_julia_things
