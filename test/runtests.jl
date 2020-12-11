using Jive
skips = ["revise.jl"]
runtests(@__DIR__, skip=skips, node1=["stdlib/sharedarrays", "stdlib/distributed"])
