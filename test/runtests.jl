using Test

# JL_SKIP=0 julia runtests.jl
skipped_tests = Dict(:list => [], :pass => !haskey(ENV, "JL_SKIP"))

all_tests = []
for (root, dirs, files) in walkdir(".")
    for filename in files
        !endswith(filename, ".jl") && continue
        "runtests.jl" == filename && continue
        filepath = joinpath(root, filename)[3:end]
        !isempty(ARGS) && !any(x->startswith(filepath, x), ARGS) && continue
        push!(all_tests, filepath)
    end
end

for (idx, filepath) in enumerate(all_tests)
    numbering = string(idx, /, length(all_tests))
    ts = @testset "$numbering $filepath" begin
        include(filepath)
    end
end

!isempty(skipped_tests[:list]) && printstyled(string("skipped tests: ", join(skipped_tests[:list], ", "), "\n"), color=:yellow)
