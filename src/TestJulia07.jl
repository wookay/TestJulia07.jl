module TestJulia07

using Pkg
using LibGit2

function pull_repo(pkg)
    path = normpath(Pkg.devdir(), pkg)
    repo = LibGit2.GitRepo(path)
    LibGit2.fetch(repo)
    ann = LibGit2.GitAnnotated(repo, "refs/remotes/origin/master")
    (ma, mp) = LibGit2.merge_analysis(repo, [ann])
    if LibGit2.isset(ma, Cint(LibGit2.Consts.MERGE_ANALYSIS_UP_TO_DATE))
        println("Already up to date.")
    else
        println()
        cmt = LibGit2.GitCommit(repo, LibGit2.GitHash(ann))
        sig = LibGit2.author(cmt)
        for (idx, line) in enumerate(split(LibGit2.message(cmt), '\n'))
            if 1 == idx
                print("  - ")
            else
                print("    ")
            end
            println(line)
        end
        println("    by ", sig.name)
        LibGit2.merge!(repo, fastforward=true)
    end
    LibGit2.close(repo)
end

# julia --color=yes -e 'using TestJulia07; TestJulia07.pull(split("Metalhead Flux"))'
function pull(pkgs::Vector)
    for pkg in pkgs
        printstyled(pkg, ' ', color=:yellow)
        pull_repo(pkg)
    end
end

end # module TestJulia07
