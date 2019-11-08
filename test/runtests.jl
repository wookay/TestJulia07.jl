using Jive
runtests(@__DIR__, skip=["revise.jl", "pkgs/revise", "pkgs/cstparser", "pkgs/flows", "pkgs/metalhead"], node1=["stdlib/sharedarrays", "stdlib/distributed"])
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
