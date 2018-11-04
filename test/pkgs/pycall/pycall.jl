module test_pkgs_pycall

using PyCall
using Test

@pyimport numpy
@test numpy.math[:__name__] == "math"
@test repr(pytypeof(numpy.math)) == "PyObject <class 'module'>"

pushfirst!(PyVector(pyimport("sys")["path"]), @__DIR__)
@pyimport ex
@test ex.f() == 42

end # module test_pkgs_pycall
