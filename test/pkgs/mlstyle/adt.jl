module test_pkgs_mlstyle_adt

using Test
using MLStyle

# Algebraic Data Types

ret = @match (1, 2, (3, 4, (5, ))) begin
    (a, b, (c, d, (6, ))) => 0
    (a, b, (c, d, (5, ))) => (a, b, c, d)
end

@test ret == (1, 2, 3, 4)


f(x) = @match x begin
    ::String           => "is string"
    _                  => "is any"
end
@test f("hi") == "is string"

end # module test_pkgs_mlstyle_adt
