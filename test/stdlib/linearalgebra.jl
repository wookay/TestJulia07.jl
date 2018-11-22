module test_stdlib_linearalgebra_cholesky

using LinearAlgebra
using Test

# https://en.wikipedia.org/wiki/Cholesky_decomposition#Example

A = [  4  12 -16;
      12  37 -43;
     -16 -43  98]

@test UpperTriangular(A) ==
      triu(A) ==
                            [  4  12 -16;
                               0  37 -43;
                               0   0  98]

@test LowerTriangular(A) ==
      tril(A) ==
                            [  4   0   0;
                              12  37   0;
                             -16 -43  98]
@test issymmetric(A)
@test A' == adjoint(A) == transpose(A) == A

C = cholesky(A)
@test C.L * C.U == A

end # module test_stdlib_linearalgebra_cholesky


module test_stdlib_linearalgebra_eigen

using LinearAlgebra
using Test

A = [  4  12 -16;
      12  37 -43;
     -16 -43  98]

E1 = eigen(A)
E2 = eigen(2*A)
@test 2*E1.values == E2.values
@test E1.vectors == E2.vectors

end # module test_stdlib_linearalgebra_eigen


module test_stdlib_linearalgebra_diagonal

using LinearAlgebra
using Test

A = [  4  12 -16;
      12  37 -43;
     -16 -43  98]
@test Diagonal(A) ==
      Diagonal(diag(A)) ==
      diagm(0=>diag(A)) ==
                           [  4   0   0;
                              0  37   0;
                              0   0  98]
@test I * A == A
@test I + A == Diagonal([1, 1, 1]) + A

end # module test_stdlib_linearalgebra_diagonal
