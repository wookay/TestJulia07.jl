using Jive
skips = ["revise.jl", "pkgs/unicodeplots"]
runtests(@__DIR__, skip=skips, node1=["stdlib/sharedarrays", "stdlib/distributed"])
