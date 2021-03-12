module test_julia_inbounds

using Test

if Base.JLOptions().check_bounds != 1  # --check-bounds=yes

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

else # if Base.JLOptions().check_bounds != 1

@test_throws BoundsError for i in [0, 1, 2]
                             getindex([10], i)
                         end

end # if Base.JLOptions().check_bounds != 1

end # module test_julia_inbounds
