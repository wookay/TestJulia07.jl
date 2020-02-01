module test_julia_ntuple

using Test

# https://discourse.juliacn.com/t/topic/1770/3
using Base.Cartesian: @ntuple

@generated add_tuples(t1::NTuple{N,Any}, t2::NTuple{N,Any}) where {N} = :(@ntuple $N i -> t1[i] + t2[i])

@test add_tuples((1,2,3), (4,5,6)) == (5, 7, 9)

@test ntuple(x->2x, 5) == (2, 4, 6, 8, 10)

end
