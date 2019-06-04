module test_julia_cartesian

using Test

start = CartesianIndex(1, 2, 5)
stop = CartesianIndex(1, 3, 7)
range = CartesianIndices(start:stop)
@test range isa CartesianIndices{3}
@test length(range) == 6
@test range[:, :, 1] == [CartesianIndex(1, 1, 1) CartesianIndex(1, 2, 1)]
@test range[:, :, 2] == [CartesianIndex(1, 1, 2) CartesianIndex(1, 2, 2)]
@test range[:, :, 3] == [CartesianIndex(1, 1, 3) CartesianIndex(1, 2, 3)]
@test range[:, 1, :] == [CartesianIndex(1, 1, 1) CartesianIndex(1, 1, 2) CartesianIndex(1, 1, 3)]
@test range[:, 2, :] == [CartesianIndex(1, 2, 1) CartesianIndex(1, 2, 2) CartesianIndex(1, 2, 3)]
@test range[1] == CartesianIndex(1, 1, 1)
@test range[2] == CartesianIndex(1, 2, 1)
@test range[3] == CartesianIndex(1, 1, 2)
@test range[4] == CartesianIndex(1, 2, 2)
@test range[5] == CartesianIndex(1, 1, 3)
@test range[6] == CartesianIndex(1, 2, 3)

end # module test_julia_cartesian
