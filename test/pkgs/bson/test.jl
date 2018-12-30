module test_pkgs_bson

using Test
using BSON

path = normpath(@__DIR__, "sample.bson")
dict = Dict("k" => "v")
BSON.@save path dict

dict = nothing

BSON.@load path dict
@test dict == Dict("k" => "v")

end # module test_pkgs_bson
