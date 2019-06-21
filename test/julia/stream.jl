module test_julia_stream

using Test

path = normpath(@__DIR__, "stream.jl")

io = open(path)
@test position(io) == 0

seek(io, 1)
@test position(io) == 1

seekend(io)

seekstart(io)
@test position(io) == 0

close(io)

end # module test_julia_stream
