module TestJulia07

using Pkg

# julia --color=yes -e 'using TestJulia07; TestJulia07.pull(split("Metalhead Flux"))'
function pull(pkgs::Vector)
    for pkg in pkgs
        printstyled(pkg, ' ', color=:yellow)
        path = normpath(Pkg.devdir(), pkg)
        cd(path)
        run(`git pull`)
    end
end

end # module TestJulia07
