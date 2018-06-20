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
    G(similar(Array{ElType}, axes(bc)), A.sr)
end

function Base.getindex(x::G{T,N}, inds::Vararg{Int,N}) where {T,N}
    @info :getindex
    x.data[inds...]
end

function Base.setindex!(x::G{T,N}, val, inds::Vararg{Int,N}) where {T,N}
    @info :setindex
    x.data[inds...] = val
end

function Broadcast.broadcasted(::typeof(+), ::G{T,N}, ::Int) where {T,N}
    @info :broadcasted
end


using DataLogger
output = DataLogger.read_stdout() do

g  = G{Int,1}([5,6], "")
g2 = Float32.(g)
@info :g2 g2 isa G{Float32,1}

@info :g3 g2 .+ 1


@info :g5 g2 .+ 1

end

using Test
@test output == """
Record ( Main style.jl#12 ) BroadcastStyle
Record ( Main style.jl#17 ) size
Record ( Main style.jl#22 ) similar   (T, N, ElType) = (Int64, 1, Float32)
Record ( Main style.jl#17 ) size
Record ( Main style.jl#17 ) size
Record ( Main style.jl#28 ) getindex
Record ( Main style.jl#33 ) setindex
Record ( Main style.jl#28 ) getindex
Record ( Main style.jl#33 ) setindex
Record ( Main style.jl#47 ) g2   g2 isa G{Float32, 1} = true
Record ( Main style.jl#38 ) broadcasted
Record ( Main style.jl#49 ) g3   g2 .+ 1 = nothing
Record ( Main style.jl#38 ) broadcasted
Record ( Main style.jl#52 ) g5   g2 .+ 1 = nothing
"""
