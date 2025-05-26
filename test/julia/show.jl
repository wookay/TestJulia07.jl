module test_julia_show

using Test

buf = IOBuffer()
ioc = IOContext(buf, :SHOWN_SET => 5)
Base.show_circular(ioc, 5)
@test String(take!(buf)) == "#= circular reference @-1 =#"

@test sprint(Base.showarg, 1, true) == "Int64"
@test sprint(Base.showarg, 1, false) == "::Int64"

end # module test_julia_show
