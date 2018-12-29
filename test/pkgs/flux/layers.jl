module test_pkgs_flux_layers

using Test
using Flux
using Flux: param, glorot_uniform
using Random

Random.seed!(0)

# Dense(in::Integer, out::Integer, σ = identity)
l = Dense(1, 2)

# Flux/util.jl
# glorot_uniform(dims...) = (rand(Float32, dims...) .- 0.5f0) .* sqrt(24.0f0/sum(dims))
@test l.W ≈ param([0.7760091f0; 0.74028003f0])
@test l.b == param(zeros(2))
@test l.σ == identity

c = Chain(l)
@test c.layers == (l,)
@test c([1]) == c.layers[1]([1]) == param([0.7760091f0; 0.74028003f0])
@test size(c([1])) == (2,)

# Diagonal(in::Integer)
d = Flux.Diagonal(3)
@test d([5 6 7 8 9;]) == param([
 5.0  6.0  7.0  8.0  9.0
 5.0  6.0  7.0  8.0  9.0
 5.0  6.0  7.0  8.0  9.0
])

# Conv(size, in=>out, σ=relu, stride=1, pad=0, dilation=1) 
cl = Conv((2,2), 1=>2)
@test cl.σ == identity
@test size(cl.weight) == (2, 2, 1, 2)
@test cl.bias == param([0, 0])
@test cl.stride == (1, 1)
@test cl.pad == (0, 0)
@test cl.dilation == (1, 1)

# MaxPool(k; pad = 0, stride = k)
maxpl = MaxPool((2,))
@test maxpl.k == (2,)
@test maxpl.pad == (0,)
@test maxpl.stride == (2,)

# MeanPool(k; pad = 0, stride = k)
meanpl = MeanPool((2,))
@test meanpl.k == (2,)
@test meanpl.pad == (0,)
@test meanpl.stride == (2,)

# Dropout(p)
dl = Dropout(0.5)
@test dl.p == 0.5
@test dl.active == true

# Recur(m, h = hidden(m))
#   h, y = cell(h, x...)
# https://github.com/FluxML/Flux.jl/blob/master/src/layers/recurrent.jl#L17
accum(h, x) = (h+x, x)
rnn = Flux.Recur(accum, 0)
@test rnn(2) == 2
@test rnn(3) == 3
@test rnn.state == 5
rnn.(1:10) # apply to a sequence
@test rnn.state == 60

# Mean Square Error
@test Flux.mse(collect(1:5), collect(1:5).+5) == 25
@test Flux.mse(collect(1:5), collect(1:5).+10) == 100

end # module test_pkgs_flux_layers
