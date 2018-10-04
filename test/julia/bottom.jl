using Test

@test Base.Bottom === Union{}
@test Core.TypeofBottom === typeof(Union{})
