module test_julia_syntax

using Test

# &&
@test (false && 42) === false
@test (true  && 42) === 42

end # module test_julia_syntax
