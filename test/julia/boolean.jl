module test_julia_boolean

using Test

@test true isa Number
@test 2true + true == 3
@test 2false == 0
@test false - true == -1

@test true == 1
@test false == 0

end # module test_julia_boolean
