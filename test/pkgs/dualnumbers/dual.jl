module test_pkgs_dualnumbers

using DualNumbers
using Test

x = Dual(2, 1)
f(x) = x^3
y = f(x)

@test repr(y) == "8 + 12ɛ"
@test realpart(y) == 8
@test dualpart(y) == 12

end # module test_pkgs_dualnumbers
