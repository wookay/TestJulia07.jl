module test_julia_global

using Test

n = 1

function f()
    global n += 2
end


f()
@test n == 3

@test Main.test_julia_global.n == 3

end # module test_julia_global
