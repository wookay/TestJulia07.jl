using Jive # runtests Jive.Skipped
runtests(@__DIR__, node1=["stdlib/sharedarrays.jl"])
!isempty(Jive.Skipped.modules) && printstyled("skipped tests: ", join(Jive.Skipped.modules, ", "), "\n", color=:yellow)
