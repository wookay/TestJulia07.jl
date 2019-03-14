module test_julia_missing

using Test

@test (missing in []    ) === false
@test (missing in [1]   ) === missing
@test (missing in ()    ) === false
@test (missing in (1,)  ) === missing
@test (missing in Set() ) === false
@test (missing in Set(1)) === false

end # module test_julia_missing
