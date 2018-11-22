module test_pkgs_diffrules_basic

using DiffRules
using Test

@test DiffRules.diffrule(:Base, :sin, 1) == :(cos(1))

end # module test_pkgs_diffrules_basic
