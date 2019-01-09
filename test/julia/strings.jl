module test_julia_strings

using Test

s = first(split("a,b", ","))

@test s isa AbstractString
@test s isa SubString{String}
@test !(s isa String)

end # module test_julia_strings
