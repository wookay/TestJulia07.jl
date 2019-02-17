module test_goto

using Test

function gotojump(x)
    @goto jump
    x += 2
    @label jump
    x
end

@test 1 == gotojump(1)


function gototop(x)
    @label top
    x += 2
    x < 2 && @goto top
    x
end

@test 3 == gototop(1)

end
