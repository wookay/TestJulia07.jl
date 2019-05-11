module test_julia_complex

using Test

# https://en.wikipedia.org/wiki/Conjugate_transpose#Example
A = [1     -2-im  5
     1+im     im  4-2im]

@test transpose(A) == [ 1      1+im
                       -2-im     im
                        5     4-2im]

@test A' == adjoint(A) == [ 1      1-im
                           -2+im    -im
                            5     4+2im]

@test conj(A) == [1     -2+im  5
                  1-im    -im  4+2im]

end # module test_julia_complex
