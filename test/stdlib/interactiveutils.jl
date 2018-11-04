module test_stdlib_interactiveutils

using InteractiveUtils, Test

@test @which(+) === Base

meth = @which(1+2)
@test meth.file === Symbol("int.jl")

end # module test_stdlib_interactiveutils
