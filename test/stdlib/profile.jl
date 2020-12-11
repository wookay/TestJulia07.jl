module test_stdlib_profile

using Profile

f() = 0

@profile f()

# statprofilehtml()

end # module test_stdlib_profile
