using Jive # runtests Jive.Skipped
runtests(@__DIR__, skip=["revise.jl", "pkgs/revise", "pkgs/cstparser"], node1=["stdlib/sharedarrays.jl"])
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
