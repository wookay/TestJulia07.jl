module test_pkgs_splitapplycombine_invert

using Test
using SplitApplyCombine

a = [(a=1,b=2), (a=3,b=5), (a=5,b=8), (a=5,b=9)]
@test group(x -> x.a > 2, a)[true] == [(a=3,b=5), (a=5,b=8), (a=5,b=9)]
@test group(x -> x.a, a)[5] == [(a=5,b=8), (a=5,b=9)]

@test invert(a) == (a = [1, 3, 5, 5], b = [2, 5, 8, 9])
@test (invert ∘ invert)(a) == a

end # test_pkgs_splitapplycombine_invert
