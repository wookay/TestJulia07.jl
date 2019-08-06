@If VERSION < v"1.2" module test_pkgs_umap_neighbors

using Test
using UMAP # UMAP_
using LinearAlgebra # issymmetric

# data = rand(3, 5)
data = [
    0.669302  0.876311  0.339679  0.754969   0.42206
    0.79313   0.72303   0.395646  0.468025   0.103991
    0.12596   0.677444  0.755612  0.0042445  0.649399
]

umap_struct = UMAP_(data, 2, n_neighbors=3) # (X, n_components; n_neighbors)
@test size(umap_struct.graph) == (5, 5)
@test issymmetric(umap_struct.graph)
@test size(umap_struct.embedding) == (2, 5)

end # module test_pkgs_umap_neighbors
