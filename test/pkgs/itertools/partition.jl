module test_pkgs_itertools_partition

using Test
using IterTools: partition

@test collect(partition(1:5, 1, 1)) == [(1,), (2,), (3,), (4,), (5,)]
@test collect(partition(1:5, 1, 2)) == [(1,), (3,), (5,)]
@test collect(partition(1:5, 2, 1)) == [(1, 2), (2, 3), (3, 4), (4, 5)]
@test collect(partition(1:5, 2, 2)) == [(1, 2), (3, 4)]

end # module test_pkgs_itertools_partition
