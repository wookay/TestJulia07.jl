using Jive
skips = ["revise.jl", "pkgs/revise", "pkgs/cstparser", "pkgs/flows", "pkgs/metalhead", "pkgs/cassette", "pkgs/temporal", "pkgs/umap"]
if haskey(ENV, "TRAVIS")
    push!(skips, "julia/inbounds")
    if VERSION >= v"1.3"
        append!(skips, ["pkgs/flux"])
    end
end
if VERSION >= v"1.6.0-DEV.947"
    append!(skips, ["pkgs/forwarddiff/api.jl"])
end
runtests(@__DIR__, skip=skips, node1=["stdlib/sharedarrays", "stdlib/distributed", "pkgs/fileio/dummy.jl"])
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
