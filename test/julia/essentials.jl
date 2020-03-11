module test_julia_essentials

using Test

@test (:) isa Colon
@test (:) === Colon()

end # module test_julia_essentials
