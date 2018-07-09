using PyCall
using Test

@pyimport numpy
@test numpy.math[:__name__] == "math"
@test repr(pytypeof(numpy.math)) == "PyObject <class 'module'>"
