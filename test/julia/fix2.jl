module test_julia_fix2

using Test

@test in(2) isa Base.Fix2
@test in(2).(1:5) == [false, true, false, false, false]

if VERSION >= v"1.3"
    ispositive = >(0)
    isnegative = <(0)
    @test ispositive(1)
    @test isnegative(-1)
end

end # module test_julia_fix2
