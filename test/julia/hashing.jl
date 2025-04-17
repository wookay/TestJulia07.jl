module test_julia_hashing

using Test

# hash
# == isequal
@test hash(2) == hash(2)
@test !((==) isa Core.Builtin)

# objectid
# ===
@test objectid(2) == objectid(2) == ccall(:jl_object_id, UInt, (Any,), 2)
@test (===) isa Core.Builtin

@test ===(≡, ===)
@test !==(==, ===)

end # module test_julia_hashing
