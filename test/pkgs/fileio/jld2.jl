using FileIO
using Test

name = "ex.jld2"
save(name, Dict("x"=>[1,2,3]))
ex = load(name)
@test ex == Dict("x"=>[1,2,3])
