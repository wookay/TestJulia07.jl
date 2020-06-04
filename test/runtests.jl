using Jive
skips = ["revise.jl", "pkgs/revise", "pkgs/cstparser", "pkgs/flows", "pkgs/metalhead", "pkgs/cassette", "pkgs/temporal"]
if haskey(ENV, "TRAVIS")
    push!(skips, "julia/inbounds")
    ENV["TRAVIS_JULIA_VERSION"] == "nightly" && append!(skips, ["pkgs/flux"])
end
runtests(@__DIR__, skip=skips, node1=["stdlib/sharedarrays", "stdlib/distributed"])
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
