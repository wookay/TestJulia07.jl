module test_julia_inbounds

using Test

@test_throws BoundsError for i in [0, 1, 2]
                             getindex([10], i)
                         end

vals = []
@inbounds for i in [0, 1, 2]
              c = getindex([10], i)
              push!(vals, c)
          end
@test ==(10).(vals) == [false, true, false]

vals = []
for i in [0, 1, 2]
    c = @inbounds getindex([10], i)
    push!(vals, c)
end
@test ==(10).(vals) == [false, true, false]

end # module test_julia_inbounds
