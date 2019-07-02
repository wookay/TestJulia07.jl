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

end # module test_julia_strings
