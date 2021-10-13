module test_julia_parse

using Test

@test parse(Bool, "1") === true
@test parse(Bool, "0") === false
@test parse(Bool, "true")  === true
@test parse(Bool, "false") === false

@test tryparse(Bool, "1") === true
@test tryparse(Bool, "0") === false
@test tryparse(Bool, "true")  === true
@test tryparse(Bool, "false") === false

@test_throws ArgumentError parse(Bool, "ON")
@test                      tryparse(Bool, "ON") === nothing

end # module test_julia_parse
