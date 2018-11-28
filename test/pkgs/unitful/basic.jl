module test_pkgs_unitful_basic

using Unitful # uconvert
using Unitful: °F, °C
using Test

@test uconvert(°C, 212°F) == 100°C

end # module test_pkgs_unitful_basic
