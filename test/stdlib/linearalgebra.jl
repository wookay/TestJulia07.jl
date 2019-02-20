module test_stdlib_linearalgebra_cholesky

using Test
using LinearAlgebra

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

using Test
using LinearAlgebra

A = [  4  12 -16;
      12  37 -43;
     -16 -43  98]

E1 = eigen(A)
E2 = eigen(2*A)
@test 2*E1.values == E2.values
@test E1.vectors == E2.vectors

end # module test_stdlib_linearalgebra_eigen


module test_stdlib_linearalgebra_diagonal

using Test
using LinearAlgebra

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


module test_stdlib_linearalgebra_det

using Test
using LinearAlgebra

A = [4 3;
     6 3]
@test det(A) == 4*3 - 3*6 == -6
@test det(exp(A)) ≈ exp(tr(A)) == 1096.6331584284585
@test sum(diag(A)) == tr(A) ≈ log(det(exp(A)))
@test tr(I - inv(A)) < tr(A - I)

end # module test_stdlib_linearalgebra_det


module test_stdlib_linearalgebra_rank

using Test
using LinearAlgebra

@test rank(-5) == rank(5) == 1
@test rank(0) == 0
@test rank([ 0 0 0; 0 2 2; 0 3 3]) == 1
@test rank([ 0 0 0; 0 0 2; 0 3 3]) == 2

end # module test_stdlib_linearalgebra_rank
