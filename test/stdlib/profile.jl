module test_stdlib_profile

using Profile
using Bukdu
# using StatProfilerHTML

@profile get("/") do conn::Conn
end

# statprofilehtml()

end # module test_stdlib_profile