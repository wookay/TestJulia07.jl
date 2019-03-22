using Test

path = normpath(@__DIR__, "sample.json")
data = read(path, String)

using JSON2
@test JSON2.write((pi=3.14,)) == rstrip(data)
@test JSON2.write(Dict("pi" => 3.14)) == rstrip(data)
@test JSON2.read(data) == (pi=3.14,)
@test JSON2.read(data, Dict) == Dict("pi" => 3.14)

using JSON
@test JSON.json((pi=3.14,)) == rstrip(data)
@test JSON.json(Dict("pi" => 3.14)) == rstrip(data)
@test JSON.parse(data) == Dict("pi" => 3.14)
@test JSON.parsefile(path) == Dict("pi" => 3.14)
