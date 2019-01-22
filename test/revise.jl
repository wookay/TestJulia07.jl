using Revise, Jive
watch(@__DIR__, sources=[]) do path
    @info :changed path
    revise()
    runtests(@__DIR__, skip=["revise.jl"])
end
# Jive.stop(watch)

