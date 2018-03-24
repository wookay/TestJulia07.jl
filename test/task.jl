using Test

t = @async begin
    return true
end
@test fetch(t)

t = @async begin
    return "hello"
end
@test fetch(t) == "hello"

t = @async "world"
@test fetch(t) == "world"
