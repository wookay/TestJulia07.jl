module test_pkgs_json2

using Test
using JSON2

d = Dict("pi"=>3.14)
open(normpath(@__DIR__, "sample.json"), "w") do f
    JSON2.write(f, d)
end

json = read(normpath(@__DIR__, "sample.json"), String)
@test JSON2.read(json, Dict) == Dict("pi"=>3.14)
@test JSON2.read(json, Any) == (pi=3.14,)
@test JSON2.read(json) == (pi=3.14,)
@test JSON2.read(json, NamedTuple) == (pi=3.14,)

end
