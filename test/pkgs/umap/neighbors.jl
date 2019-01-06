module test_pkgs_umap_neighbors

using Test
using UMAP # UMAP_
using LinearAlgebra # issymmetric

# data = [rand(3) for _ in 1:5]
data = [
 [0.302073, 0.208284, 0.618048],
 [0.11165,  0.579617, 0.221411],
 [0.774946, 0.888241, 0.976376],
 [0.664977, 0.757051, 0.374249],
 [0.226293, 0.753836, 0.727748]]

umap_struct = UMAP_(data, 3) # (X, n_neighbors)
@test size(umap_struct.graph) == (5, 5)
@test issymmetric(umap_struct.graph)
@test size(umap_struct.embedding) == (2, 5)

end # module test_pkgs_umap_neighbors
