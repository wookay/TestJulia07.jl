module TestJulia07

function pull(pkgs::Vector)
    for pkg in pkgs
        printstyled(pkg, ' ', color=:yellow)
        path = normpath(ENV["HOME"], ".julia", "dev", pkg)
        cd(path)
        run(`git pull`)
    end
end

end # module TestJulia07
