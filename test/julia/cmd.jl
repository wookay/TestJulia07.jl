module test_julia_cmd

using Test

cmd = "a b"
@test string(`$cmd`) == """`'a b'`"""

cmd = "abc"
@test string(`$cmd`) == """`abc`"""

end # module test_julia_cmd
