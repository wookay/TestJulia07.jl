module test_julia_broadcast_style

struct G{T,N} <: AbstractArray{T, N}
    data::Array{T,N}
    sr::String
end

#function Base.broadcastable(x::G{T,N}) where {T,N}
#    @info :broadcastable
#    x
#end

function Base.BroadcastStyle(::Type{G{T,N}}) where {T,N}
    @info :BroadcastStyle
    Broadcast.ArrayStyle{G{T,N}}()
end

function Base.size(x::G{T,N}) where {T,N}
    @info :size
    size(x.data)
end

function Base.similar(bc::Broadcast.Broadcasted{Broadcast.ArrayStyle{G{T,N}}}, ::Type{ElType}) where {T,N,ElType}
    @info :similar (T,N,ElType)
    A = bc.args[1]
    G(Array{ElType}(undef, length.(axes(bc))), A.sr)
end

function Base.getindex(x::G{T,N}, inds::Vararg{Int,N}) where {T,N}
    @info :getindex
    x.data[inds...]
end

function Base.setindex!(x::G{T,N}, val, inds::Vararg{Int,N}) where {T,N}
    @info :setindex
    x.data[inds...] = val
end


using DataLogger
output = DataLogger.read_stdout() do

g  = G{Int,1}([5,6], "")
g2 = Float32.(g)
@info :g2 g2 isa G{Float32,1}

eval(quote

    @info :g3 $g2 .+ 1

    function Broadcast.broadcasted(::typeof(+), ::G{T,N}, ::Int) where {T,N}
        @info :broadcasted
        :nothing
    end

    @info :g5 $g2 .+ 1

end)

end

using Test
@test output == """
Main.test_julia_broadcast_style style.jl#14  BroadcastStyle
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#24  similar    (T, N, ElType) = (Int64, 1, Float32)
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#35  setindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#35  setindex
Main.test_julia_broadcast_style style.jl#45  g2    g2 isa G{Float32, 1} = true
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#14  BroadcastStyle
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#24  similar    (T, N, ElType) = (Float32, 1, Float32)
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#35  setindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#35  setindex
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#19  size
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#30  getindex
Main.test_julia_broadcast_style style.jl#49  g3    Float32[5.0, 6.0] .+ 1 = Float32[6.0, 7.0]
Main.test_julia_broadcast_style style.jl#52  broadcasted
Main.test_julia_broadcast_style style.jl#56  g5    Float32[5.0, 6.0] .+ 1 = nothing
"""

end # module test_julia_broadcast_style
