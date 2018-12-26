module test_julia_symbols

using Test

a,b=1,2

@test a:b == 1:2
@test  :b ==  :b

end
