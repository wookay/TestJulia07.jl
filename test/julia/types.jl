using Test

@test Base.uniontypes(Int) == [Int]
@test Base.uniontypes(Union{Int,String}) == [Int,String]

@test typeof(Union{}) == Core.TypeofBottom
@test typeof(Union) == DataType
@test Union{Int} == Int
