using Test

n = 1

function f()
    global n += 2
end


f()
@test n == 3

@test Main.n == 3
