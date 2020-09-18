using Jive
skips = ["revise.jl", "pkgs/revise", "pkgs/cstparser", "pkgs/flows", "pkgs/metalhead", "pkgs/cassette", "pkgs/temporal", "pkgs/umap"]
if haskey(ENV, "TRAVIS")
    push!(skips, "julia/inbounds")
    if VERSION >= v"1.3"
        append!(skips, ["pkgs/flux"])
    end
end
runtests(@__DIR__, skip=skips, node1=["stdlib/sharedarrays", "stdlib/distributed"])
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
