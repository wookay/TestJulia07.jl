module test_julia_ref

using Test

function house()
    ref_switch_status = Ref{Bool}()
    function switch(b::Bool)
        ref_switch_status[] = b
    end
    function room()
        ref_switch_status[]
    end
    (switch, room)
end

switch1, room1 = house()
switch2, room2 = house()

switch1(true)
switch2(false)
@test room1() === true
@test room2() === false

switch1(false)
switch2(true)
@test room1() === false
@test room2() === true

end # test_julia_ref
