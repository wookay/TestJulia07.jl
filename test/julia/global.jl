module test_julia_global

using Test

n = 1
@test n == 1

function f()
    global n += 2
end

f()
@test n == 3

@test Main.test_julia_global.n == 3

end # module test_julia_global


module test_julia_global_local

using Test

local n = 1
@test_throws UndefVarError n == 1

function f()
    global n
    n += 2
end

@test_throws UndefVarError f()
@test_throws UndefVarError n == 3

end # module test_julia_global_local
