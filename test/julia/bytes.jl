module test_julia_bytes

using Test

u8 = Vector{UInt8}([0x01, 0x02, 0x03, 0x04])
u32 = Vector{UInt32}([0x04030201])

@test reinterpret(UInt32, u8) == u32
@test reinterpret(UInt8, u32) == u8

end # module test_julia_bytes
