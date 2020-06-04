using Jive
skips = ["revise.jl", "pkgs/revise", "pkgs/cstparser", "pkgs/flows", "pkgs/metalhead"]
if haskey(ENV, "TRAVIS")
    push!(skips, "julia/inbounds")
    ENV["TRAVIS_JULIA_VERSION"] == "nightly" && append!(skips, ["pkgs/flux", "pkgs/cassette"])
end
runtests(@__DIR__, skip=skips, node1=["stdlib/sharedarrays", "stdlib/distributed"])
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
