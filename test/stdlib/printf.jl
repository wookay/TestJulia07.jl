module test_stdlib_printf

using Printf
using Test

@test Printf.@sprintf("%.7f", 1/11025) == "0.0000907"

end # module test_stdlib_printf
