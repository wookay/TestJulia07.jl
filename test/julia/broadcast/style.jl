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


using IOCapture
(value, output) = IOCapture.capture() do

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
[ Info: BroadcastStyle
[ Info: size
┌ Info: similar
└   (T, N, ElType) = (Int64, 1, Float32)
[ Info: size
[ Info: size
[ Info: getindex
[ Info: setindex
[ Info: getindex
[ Info: setindex
┌ Info: g2
└   g2 isa G{Float32, 1} = true
[ Info: size
[ Info: size
[ Info: size
[ Info: getindex
[ Info: getindex
[ Info: getindex
[ Info: getindex
[ Info: size
[ Info: size
[ Info: size
[ Info: getindex
[ Info: getindex
[ Info: getindex
[ Info: getindex
[ Info: size
[ Info: size
[ Info: size
[ Info: getindex
[ Info: getindex
[ Info: getindex
[ Info: getindex
[ Info: size
[ Info: size
[ Info: size
[ Info: getindex
[ Info: getindex
[ Info: getindex
[ Info: getindex
[ Info: BroadcastStyle
[ Info: size
┌ Info: similar
└   (T, N, ElType) = (Float32, 1, Float32)
[ Info: size
[ Info: size
[ Info: getindex
[ Info: setindex
[ Info: getindex
[ Info: setindex
[ Info: size
[ Info: size
[ Info: size
[ Info: size
[ Info: size
[ Info: getindex
[ Info: size
[ Info: getindex
[ Info: size
[ Info: getindex
[ Info: size
[ Info: getindex
[ Info: size
[ Info: getindex
[ Info: size
[ Info: getindex
[ Info: size
[ Info: getindex
[ Info: size
[ Info: getindex
┌ Info: g3
│   Float32[5.0, 6.0] .+ 1 =
│    2-element Main.test_julia_broadcast_style.G{Float32, 1}:
│     6.0
└     7.0
[ Info: broadcasted
┌ Info: g5
└   Float32[5.0, 6.0] .+ 1 = :nothing
"""

end # module test_julia_broadcast_style
