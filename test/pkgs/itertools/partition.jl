module test_pkgs_itertools_partition

using Test
using IterTools

@test collect(IterTools.partition(1:5, 1, 1)) == [(1,), (2,), (3,), (4,), (5,)]
@test collect(IterTools.partition(1:5, 1, 2)) == [(1,), (3,), (5,)]
@test collect(IterTools.partition(1:5, 2, 1)) == [(1, 2), (2, 3), (3, 4), (4, 5)]
@test collect(IterTools.partition(1:5, 2, 2)) == [(1, 2), (3, 4)]

function pair_sum(nums, target)
    filter(pair -> sum(pair) == target, collect.(IterTools.partition(nums, 2, 1)))
end
@test pair_sum([2, 7, 11, 15, 4, 5], 9) == [[2, 7], [4, 5]]
@test pair_sum([2, 7, 11, 15, 8, 4, 5], 9) == [[2, 7], [4, 5]]

end # module test_pkgs_itertools_partition
