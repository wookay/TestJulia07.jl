module test_julia_bottom

using Test

@test Base.Bottom === Union{}
@test Core.TypeofBottom === typeof(Union{})

end # module test_julia_bottom
