module test_julia_io

using Test

buf = IOBuffer()

println(buf, "abc")
seekstart(buf)
@test "abc\n" == String(read(buf))
@test "" == String(read(buf))

println(buf, "xyz")
seekstart(buf)
@test "abc\nxyz\n" == String(read(buf))

end # module test_julia_io
