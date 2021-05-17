module test_julia_range

using Test

r = range(1, step=2, stop=10)

@test r == 1:2:9
@test first(r) == 1
@test step(r) == 2
@test last(r) == 9

end # module test_julia_range
