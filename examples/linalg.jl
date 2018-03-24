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
