module test_julia_fix2

using Test

@test in(2) isa Base.Fix2
@test in(2).(1:5) == [false, true, false, false, false]

end # module test_julia_fix2
