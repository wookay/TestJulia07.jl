module test_julia_splat

using Test

if VERSION >= v"1.9.0-DEV.513"
@test Base.Splat(+)((1,2,3)) == .+(1,2,3) == 6
else
@test Base.splat(+)((1,2,3)) == .+(1,2,3) == 6
end

end # module test_julia_splat
