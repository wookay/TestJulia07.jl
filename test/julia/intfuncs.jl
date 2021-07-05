module test_julia_intfuncs

using Test

@test ndigits( 5) == 1
@test ndigits(35) == 2

end # module test_julia_intfuncs
