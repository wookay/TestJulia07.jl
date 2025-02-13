module test_julia_inbounds

using Test

@test_throws BoundsError           getindex([10], 0)
@test_throws BoundsError @inbounds getindex([10], 0)
@test              10 ==           getindex([10], 1)
@test              10 == @inbounds getindex([10], 1)
@test_throws BoundsError           getindex([10], 2)
@test_throws BoundsError @inbounds getindex([10], 2)

#   --check-bounds
const Check_Bounds_Auto = 0
const Check_Bounds_Yes  = 1
const Check_Bounds_No   = 2

vals = []

if Base.JLOptions().check_bounds == Check_Bounds_Auto

@test_throws BoundsError           for i in 1:3
                                       c = getindex([100], i)
                                       push!(vals, c == 100)
                                   end

                         @inbounds for i in 1:3
                                       c = getindex([100], i)
                                       push!(vals, c == 100)
                                   end
@test vals == [true, true, false, false]


elseif Base.JLOptions().check_bounds == Check_Bounds_Yes

@test_throws BoundsError           for i in 1:3
                                       c = getindex([100], i)
                                       push!(vals, c == 100)
                                   end

@test_throws BoundsError @inbounds for i in 1:3
                                       c = getindex([100], i)
                                       push!(vals, c == 100)
                                   end
@test vals == [true, true]


elseif Base.JLOptions().check_bounds == Check_Bounds_No

                                   for i in 1:3
                                       c = getindex([100], i)
                                       push!(vals, c == 100)
                                   end

                         @inbounds for i in 1:3
                                       c = getindex([100], i)
                                       push!(vals, c == 100)
                                   end
@test vals == [true, false, false, true, false, false]

end # if Base.JLOptions().check_bounds == Check_Bounds_Auto

end # module test_julia_inbounds
