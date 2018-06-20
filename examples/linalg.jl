using LinearAlgebra

A = [1 2 3; 4 5 6; 7 8 9]

for t in [
Symmetric
Hermitian
UpperTriangular
LowerTriangular
Tridiagonal
Diagonal
]
    show(stdout, MIME("text/plain"), t(A))
    println()
end

A = [1, 2, 3]
B = [5, 6]
for t in [
SymTridiagonal
]
    show(stdout, MIME("text/plain"), t(A, B))
    println()
end

A = [1, 2, 3]
B = [5, 6]
for t in [
Bidiagonal
]
    show(stdout, MIME("text/plain"), t(A, B, :U))
    println()
    show(stdout, MIME("text/plain"), t(A, B, :L))
    println()
end

for t in [
UniformScaling
]
    println(t(2))
end


#=
3×3 Symmetric{Int64,Array{Int64,2}}:
 1  2  3
 2  5  6
 3  6  9
3×3 Hermitian{Int64,Array{Int64,2}}:
 1  2  3
 2  5  6
 3  6  9
3×3 UpperTriangular{Int64,Array{Int64,2}}:
 1  2  3
 ⋅  5  6
 ⋅  ⋅  9
3×3 LowerTriangular{Int64,Array{Int64,2}}:
 1  ⋅  ⋅
 4  5  ⋅
 7  8  9
3×3 Tridiagonal{Int64,Array{Int64,1}}:
 1  2  ⋅
 4  5  6
 ⋅  8  9
3×3 Diagonal{Int64,Array{Int64,1}}:
 1  ⋅  ⋅
 ⋅  5  ⋅
 ⋅  ⋅  9
3×3 SymTridiagonal{Int64,Array{Int64,1}}:
 1  5  ⋅
 5  2  6
 ⋅  6  3
3×3 Bidiagonal{Int64,Array{Int64,1}}:
 1  5  ⋅
 ⋅  2  6
 ⋅  ⋅  3
3×3 Bidiagonal{Int64,Array{Int64,1}}:
 1  ⋅  ⋅
 5  2  ⋅
 ⋅  6  3
UniformScaling{Int64}
2*I
=#
