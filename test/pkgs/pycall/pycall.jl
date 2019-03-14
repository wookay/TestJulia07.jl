module test_pkgs_pycall

using PyCall
using Test

numpy = pyimport("numpy")
@test numpy.math.__name__ == "math"
@test repr(pytypeof(numpy.math)) == "PyObject <class 'module'>"

end # module test_pkgs_pycall
