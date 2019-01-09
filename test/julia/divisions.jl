module test_julia_divisions

using Test

@test repr(5/3)  == "1.6666666666666667"
@test repr(5//3) == "5//3" 
@test repr(5\3)  == "0.6" 
@test repr(5÷3)  == "1" 

#@info :divisions 5/3 5//3 5\3 5÷3
#=
┌ Info: divisions
│   5 / 3 = 1.6666666666666667
│   5 // 3 = 5//3
│   5 \ 3 = 0.6
└   5 ÷ 3 = 1
=#

end # module test_julia_divisions
