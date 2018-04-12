using Test

@test Base.uniontypes(Int) == [Int]
@test Base.uniontypes(Union{Int,String}) == [Int,String]
