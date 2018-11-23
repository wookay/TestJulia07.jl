module test_pkgs_forwarddiff_api

using Test

# code from julialang slack #autodiff Jarrett Revels
using ReverseDiff, DiffResults

# x = rand(3, 3)
x = [0.401298  0.739482  0.896539
     0.124653  0.261873  0.568562
     0.742187  0.609769  0.503280]

s = similar(x)
result = DiffResults.GradientResult(s)
@test DiffResults.value(result) == first(s)
@test result isa DiffResults.MutableDiffResult

f(x) = sum(x .^ 2)

tape = ReverseDiff.compile(ReverseDiff.GradientTape(f, similar(x)))
@test tape isa ReverseDiff.CompiledTape

ReverseDiff.gradient!(result, tape, x)
# MutableDiffResult(3.0949850127609992, ([0.802596 1.47896 1.79308; 0.249306 0.523746 1.13712; 1.48437 1.21954 1.00656],))

@test DiffResults.value(result) == 3.0949850127609992

@test DiffResults.gradient(result) == 2x
# 3×3 Array{Float64,2}:
#  0.802596  1.47896   1.79308
#  0.249306  0.523746  1.13712
#  1.48437   1.21954   1.00656

@test f(x) == 3.0949850127609992

using ForwardDiff

@test ForwardDiff.gradient(f, x) == 2x
# 3×3 Array{Float64,2}:
#  0.802596  1.47896   1.79308
#  0.249306  0.523746  1.13712
#  1.48437   1.21954   1.00656

end # module test_pkgs_forwarddiff_api
