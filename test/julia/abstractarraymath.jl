module test_julia_abstractarraymath_eachrow_eachcol_eachslice

using Test

@test collect(eachrow([1, 2, 3])) == [[1], [2], [3]]
@test collect(eachrow([1 2 3; ])) == [[1, 2, 3]]
@test collect(eachrow([])) == []
@test collect(eachrow([]')) == [[]]

@test collect(eachcol([1, 2, 3])) == [[1, 2, 3]]
@test collect(eachcol([1 2 3; ])) == [[1], [2], [3]]
@test collect(eachcol([])) == [[]]
@test collect(eachcol([]')) == []

@test collect(eachslice([1 2 3;], dims=1)) == [[1, 2, 3]]
@test collect(eachslice([1 2 3;], dims=2)) == [[1], [2], [3]]

end # module test_julia_abstractarraymath_eachrow_eachcol_eachslice


module test_julia_abstractarraymath_repeat_circshift

using Test

@test repeat([1; 2; 3], 1, 5) == [1 1 1 1 1;
                                  2 2 2 2 2;
                                  3 3 3 3 3;]

@test repeat([1 2 3;], 5, 1) == [1 2 3;
                                 1 2 3;
                                 1 2 3;
                                 1 2 3;
                                 1 2 3;]

@test circshift([1, 2, 3, 4, 5], 3) ==
                      [3, 4, 5, 1, 2]

end # module test_julia_abstractarraymath_repeat_circshift
