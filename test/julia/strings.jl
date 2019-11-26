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
@test codeunits("가") == [0xea, 0xb0, 0x80]

end # module test_julia_strings
