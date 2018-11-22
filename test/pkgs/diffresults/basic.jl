module test_pkgs_diffresults_basic

using DiffResults: DiffResult, GradientResult, JacobianResult, HessianResult
using Test

rn = DiffResult(1, 2, 3)
@test rn.value == 1
@test rn.derivs == (2, 3)

end # module test_pkgs_diffresults_basic
