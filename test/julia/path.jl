module test_julia_path

using Test

@test relpath("abc/def", "abc") == "def"

end # module test_julia_path
