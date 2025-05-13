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

@test widen(Int64) === Int128
@test 1 isa Int64
@test typeof(widen(1)) === Int128
@test signed(UInt64) === Int64
@test unsigned(Int64) === UInt64
@test signbit(1) === false
@test signbit(-1)

bits(::Int64) = 64
bits(::Int32) = 32
@test bits(1) == 64
@test bits(Int32(1)) == 32

end # module test_julia_int


module test_julia_integer

using Test

f(n::Integer) = (:integer, n)
@test f(1) == (:integer, 1)

f(n::Int) = (:int, n)
@test f(1) == (:int, 1)
@test f(true) == (:integer, true)

end # module test_julia_integer


module test_julia_bswap

using Test

@test bswap(0x3039) == 0x3930
@test (bswap ∘ bswap)(0x3039) == 0x3039

end # module test_julia_bswap


module test_julia_typemax

using Test

@test typemax(UInt) == 0xffffffffffffffff
@test typemax( Int) == 0x7fffffffffffffff
@test Int128(typemax(Int)) * 2 + 1 == typemax(UInt)

end # module test_julia_typemax
