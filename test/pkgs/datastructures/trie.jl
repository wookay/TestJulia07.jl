module test_pkgs_datastructures_trie

using DataStructures
using Test

t = Trie{Int}()
t["abc"] = 1
t["abcd"] = 2

sub = subtrie(t, "ab")
@test sub isa  Trie{Int}
@test ["c", "cd"] == keys(sub)

a = []
for subpath in path(sub, "c")
   push!(a, keys(subpath))
end
@test a == [["c", "cd"], ["", "d"]]

end # module test_pkgs_datastructures_trie
