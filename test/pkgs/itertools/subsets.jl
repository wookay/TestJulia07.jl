module test_pkgs_itertools_subsets

using Test
using IterTools: subsets

a = [1, 2, 3, 4]
@test collect(subsets(a, 1)) == [[1], [2], [3], [4]]
@test collect(subsets(a, 2)) == [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
@test collect(subsets(a, 3)) == [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
@test collect(subsets(a, 4)) == [[1, 2, 3, 4]]

end # module test_pkgs_itertools_subsets
