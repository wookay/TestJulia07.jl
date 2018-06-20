using Test

f() = 2
g = @cfunction f Int ()
@test ccall(g, Int, ()) == 2


record = Any[]
function cb_func(delta::Cdouble, msg::Ptr{Cuchar}, cb_info::Ptr{Cvoid})::Cvoid
    push!(record, (delta, msg, cb_info))
    nothing
end
h = @cfunction cb_func Cvoid (Cdouble, Ptr{Cuchar}, Ptr{Cvoid})

msg = pointer("abc")
cb_info = C_NULL
ccall(h, Cvoid, (Cdouble, Ptr{Cuchar}, Ptr{Cvoid}), Cdouble(1), msg, cb_info)

@test record == [(1.0, msg, cb_info)]
