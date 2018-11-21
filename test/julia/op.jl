using Test

for arg in [(+, +, +) (+, -, -) (-, +, -) (-, -, +)]
    (a, b, c) = nameof.(arg)
    @eval Base.$a(::typeof($b)) = $c
end

@test ==(+-+, -)
@test ==(+-+-+, +)

@test (π < π) == false

@test √4π == 2pi
@test 1e-3 == 0.001
@test √4π ≈ 2pi atol=1e-3


struct G
end

import Base: +
x::G + y::G = 2

@test G() + G() == 2
