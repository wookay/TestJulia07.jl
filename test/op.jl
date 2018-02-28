using Test

for arg in [(+, +, +) (+, -, -) (-, +, -) (-, -, +)]
    (a, b, c) = nameof.(arg)
    @eval Base.$a(::typeof($b)) = $c
end

@test ==(+-+, -)
@test ==(+-+-+, +)
