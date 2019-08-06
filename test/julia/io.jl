module test_julia_io_read

using Test

buf = IOBuffer()

println(buf, "abc")
seekstart(buf)
@test "abc\n" == String(read(buf))
@test "" == String(read(buf))

println(buf, "xyz")
seekstart(buf)
@test "abc\nxyz\n" == String(read(buf))

end # module test_julia_io_read


module test_julia_io_skipchars

using Test

buf = IOBuffer()

println(buf, "\r\nabc--")
seekstart(buf)

skipchars(==(Char(UInt8('\r'))), buf)
skipchars(==('\n'), buf)

@test "abc" == String(readuntil(buf, "--"))

end # module test_julia_io_skipchars
