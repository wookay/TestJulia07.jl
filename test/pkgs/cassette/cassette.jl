#=
using Test
using Cassette: @context, @prehook, @posthook, @primitive, @pass, @overdub

x = 1
function inc()
    global x
    x += 1
end

tapepre = []
tapepost = []
@context TapeCtx
@prehook (f::Any)(args...) where {__CONTEXT__<:TapeCtx} = push!(tapepre, (f, args))
@posthook (f::Any)(args...) where {__CONTEXT__<:TapeCtx} = push!(tapepost, (f, args))
@overdub(TapeCtx(), inc())
@test tapepre == [(inc, ()), (+, (1, 1)), (Base.add_int, (1, 1))]
@test tapepost == [(2, (Base.add_int, 1, 1)), (2, (+, 1, 1)), (2, (inc,))]

dolbypre = []
dolbypost = []
@context DolbyCtx
@prehook (f::Any)(args...) where {__CONTEXT__<:DolbyCtx} = push!(dolbypre, (f, args))
@posthook (f::Any)(args...) where {__CONTEXT__<:DolbyCtx} = push!(dolbypost, (f, args))
@overdub(DolbyCtx(), inc())
@test dolbypre == [(inc, ()), (+, (2, 1)), (Base.add_int, (2, 1))]
@test dolbypost == [(3, (Base.add_int, 2, 1)), (3, (+, 2, 1)), (3, (inc,))]
=#
