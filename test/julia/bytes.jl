module test_julia_bytes

using Test

u8 = Vector{UInt8}([0x01, 0x02, 0x03, 0x04])
u32 = Vector{UInt32}([0x04030201])

@test reinterpret(UInt32, u8) == u32
@test reinterpret(UInt8, u32) == u8

end # module test_julia_bytes


module test_julia_bytes_b_str

using Test

@test b"hello" == @b_str("hello") == [0x68, 0x65, 0x6c, 0x6c, 0x6f] 

end # module test_julia_bytes_b_str
