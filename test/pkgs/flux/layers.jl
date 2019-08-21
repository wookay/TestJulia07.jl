module test_pkgs_flux_layers

using Test
using Flux
using Random

Random.seed!(0)

# Dense(in::Integer, out::Integer, σ = identity)
denseL = Dense(1, 2)
# Flux/util.jl
# glorot_uniform(dims...) = (rand(Float32, dims...) .- 0.5f0) .* sqrt(24.0f0/sum(dims))
@test denseL.W ≈ [0.7760091f0; 0.74028003f0]
@test denseL.b == zeros(2)
@test denseL.σ == identity


c = Chain(denseL)
@test c.layers == (denseL,)
@test c([1]) == c.layers[1]([1]) == [0.7760091f0; 0.74028003f0]
@test size(c([1])) == (2,)


# Diagonal(in::Integer)
diagL = Flux.Diagonal(3)
@test diagL([5 6 7 8 9;]) == [
 5.0  6.0  7.0  8.0  9.0
 5.0  6.0  7.0  8.0  9.0
 5.0  6.0  7.0  8.0  9.0
]


# Conv(size, in=>out, σ=relu, stride=1, pad=0, dilation=1) 
convL = Conv((2,2), 1=>2)
@test convL.σ == identity
@test size(convL.weight) == (2, 2, 1, 2)
@test convL.bias == [0, 0]
@test convL.stride == (1, 1)
@test convL.pad == (0, 0, 0, 0)
@test convL.dilation == (1, 1)


# MaxPool(k; pad = 0, stride = k)
maxpL = MaxPool((2,))
@test maxpL.k == (2,)
@test maxpL.pad == (0, 0)
@test maxpL.stride == (2,)


# MeanPool(k; pad = 0, stride = k)
meanpL = MeanPool((2,))
@test meanpL.k == (2,)
@test meanpL.pad == (0, 0)
@test meanpL.stride == (2,)


# Dropout(p)
dropL = Dropout(0.5)
@test dropL.p == 0.5


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
