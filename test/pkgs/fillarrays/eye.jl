module test_pkgs_fillarrays_eye

using Test
using FillArrays # Eye
using LinearAlgebra

@test Eye(5) == Diagonal([1, 1, 1, 1, 1])

end # module test_pkgs_fillarrays_eye
