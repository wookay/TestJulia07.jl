module test_julia_version

using Test

v = v"1.2.3+5"
@test v isa VersionNumber
@test v.major == 1
@test v.minor == 2
@test v.patch == 3
@test v.build == (5,)
@test v.major isa UInt32
@test v.minor isa UInt32
@test v.patch isa UInt32
@test v.build isa Tuple{UInt64}

end # module test_julia_version
