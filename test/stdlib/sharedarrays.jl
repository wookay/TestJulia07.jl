module test_stdlib_sharedarrays

using SharedArrays
using Test

@test sdata(SharedArray([1,2,3])) == [1,2,3]

end # module test_stdlib_sharedarrays
