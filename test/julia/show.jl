module test_julia_show

using Test

buf = IOBuffer()
ioc = IOContext(buf, :SHOWN_SET => 5)
Base.show_circular(ioc, 5)
@test String(take!(buf)) == "#= circular reference @-1 =#"

end # module test_julia_show
