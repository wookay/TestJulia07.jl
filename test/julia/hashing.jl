module test_julia_hashing

using Test

# hash
@test hash(2) == hash(2)
@test (===) isa Core.Builtin
@test (<:) isa Core.Builtin
@test !((==) isa Core.Builtin)

@test ==(0.0, -0.0)
@test !isequal(0.0, -0.0)
@test !isequal(hash(0.0), hash(-0.0))

# objectid
# ===
@test objectid(2) == objectid(2) == ccall(:jl_object_id, UInt, (Any,), 2)
@test (===) isa Core.Builtin

@test ===(≡, ===)
@test !==(==, ===)

end # module test_julia_hashing
