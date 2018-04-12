using Test

f() = 2
g = @cfunction f Int ()
@test ccall(g, Int, ()) == 2
