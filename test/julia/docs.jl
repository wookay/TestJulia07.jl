module test_julia_docs

using Test

"hello"
A

@test !isdefined(@__MODULE__, :A)

struct A
end

@test isdefined(@__MODULE__, :A)
@test string(Base.Docs.doc(A)) == "hello\n"

@test (:if, :else) ⊆ keys(Base.Docs.keywords)

end # module test_julia_docs
