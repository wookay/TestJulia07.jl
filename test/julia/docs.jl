module test_julia_docs

using Test
using Base.Docs

"hello"
A

@test !isdefined(@__MODULE__, :A)

struct A
end

@test isdefined(@__MODULE__, :A)
@test string(Docs.doc(A)) == "hello\n"

end # module test_julia_docs
