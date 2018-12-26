module test_pkgs_flux_hotcold

using Test
using Flux: OneHotVector, OneHotMatrix, onecold, onehot, onehotbatch

labels = ['A', 'B', 'C', 'D']

@test onecold([0,0,0,0], labels) == 'A'
@test onecold([0,1,0,0], labels) == 'B'
@test onecold([0,1,1,1], labels) == 'B'
@test onecold([1,1,1,1], labels) == 'A'

@testset "onehot" begin
    @test onehot('B', labels) == OneHotVector(2, 4)
    @test onehot('E', labels, 'C') == OneHotVector(3, 4)
    @test onehotbatch(['B','E'], labels, 'C') == OneHotMatrix(4, [OneHotVector(2, 4), OneHotVector(3, 4)])
end

end # module test_pkgs_flux_hotcold
