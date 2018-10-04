using Test

tc = Ref(0)
t = Timer(0; interval=1) do t
    tc[] += 1
#    @info :tc tc[]
    tc[] >= 5 && close(t)
#    @test isopen(t)
end
@test tc[] == 0
@test isopen(t)
