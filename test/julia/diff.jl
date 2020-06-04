using Test

@test diff([1,2,3]) == fill(1, 2)
@test diff(1:3) == fill(1, 2)
