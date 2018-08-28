module test_goto

using Test

function gogosing(x)
    @goto jump
    x += 2
    @label jump
    x
end

@test 1 == gogosing(1)

end
