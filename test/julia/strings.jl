module test_julia_strings

using Test

s = first(split("a,b", ","))

@test s isa AbstractString
@test s isa SubString{String}
@test !(s isa String)

@test repeat("123", 4) == "123123123123"
@test reshape(collect(repeat("123", 4)), (6,2)) ==
['1'  '1'
 '2'  '2'
 '3'  '3'
 '1'  '1'
 '2'  '2'
 '3'  '3']

@test rotl90(reshape(collect(repeat("123", 4)), (6,2))) ==
['1'  '2'  '3'  '1'  '2'  '3'
 '1'  '2'  '3'  '1'  '2'  '3']

@test occursin("app", "apple")

buf = Base.SecretBuffer("hello")
@test read(buf, String) == "hello"
@test read(buf, String) == ""

seekstart(buf)
@test read(buf, String) == "hello"

Base.shred!(buf)
@test Base.isshredded(buf)

seekstart(buf)
@test read(buf, String) == ""

@test length("가") == 1
@test collect("가") == ['가']

@test ncodeunits("가") == 3
@test codeunits("가")    == b"가"    == Vector{UInt8}("가")    == [0xea, 0xb0, 0x80]
@test codeunits("apple") == b"apple" == Vector{UInt8}("apple") == [0x61, 0x70, 0x70, 0x6c, 0x65]
@test collect("apple") == ['a', 'p', 'p', 'l', 'e']

if VERSION >= v"1.3"
    x = pi
    @test repr(x; context=nothing) == sprint(show, x; context=nothing) == "π"

    s = IOBuffer()
    context = :compact => true
    ctx = IOContext(s, context)
    show(ctx, pi)
    @test String(take!(s)) == "π"
end

@test hex2bytes(string(12345, base = 16)) == [0x30, 0x39]
@test 12345 == 0x3039 == Int(0x3039) == Int(0x3000 + 0x0039) == UInt16(0x30) << 8 + 0x39

end # module test_julia_strings
