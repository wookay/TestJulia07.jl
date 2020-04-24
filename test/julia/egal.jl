module test_julia_egal

using Test

@test 1 == 1.0

@test "" === ""
@test 1 !== 1.0
@test [] !== []

struct A
    val
end

@test A("") === A("")
@test A([]) !== A([])

end # module test_julia_egal
