module test_julia_replace

using Test

@test replace([1, 2, 3], 2=>0, 3=>0, 0=>5) == [1, 0, 0]
@test replace("abble", 'b'=>'p') == "apple"
@test replace("abble", "bb"=>"pp") == "apple"

end # module test_julia_replace
