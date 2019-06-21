module test_julia_endian

using Test

@test Base.ENDIAN_BOM == 0x04030201 # Little-endian machine

end # module test_julia_endian
