module test_julia_timing

using Test
using Base: @time, @timev

@time  :ok
@timev :ok

@test true

end # module test_julia_timing
