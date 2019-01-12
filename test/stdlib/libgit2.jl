module test_libgit2_fetch

using Test
using LibGit2

@test hasmethod(LibGit2.GitRepo, Tuple{String})
@test hasmethod(LibGit2.fetch, Tuple{LibGit2.GitRepo})

end # module test_libgit2_fetch
