module test_julia_int

using Test

@test UInt8(0b11111111) == 0xff
@test UInt8(0b01111111) == 0x7f
@test UInt8(0b00111111) == 0x3f
@test UInt8(0b00011111) == 0x1f
@test UInt8(0b00001111) == 0x0f
@test UInt8(0b00000111) == 0x07
@test UInt8(0b00000011) == 0x03
@test UInt8(0b00000001) == 0x01
@test UInt8(0b00000000) == 0x00

@test trailing_ones(UInt8(0b11111111)) == 8
@test trailing_ones(UInt8(0b01111111)) == 7
@test trailing_ones(UInt8(0b00000001)) == 1

@test trailing_zeros(UInt8(0b00000000)) == 8
@test trailing_zeros(UInt8(0b10000000)) == 7
@test trailing_zeros(UInt8(0b11111110)) == 1

@test leading_ones(UInt8(0b11111111)) == 8
@test leading_ones(UInt8(0b11111110)) == 7
@test leading_ones(UInt8(0b10000000)) == 1

@test leading_zeros(UInt8(0b00000000)) == 8
@test leading_zeros(UInt8(0b00000001)) == 7
@test leading_zeros(UInt8(0b01111111)) == 1

end # module test_julia_int
