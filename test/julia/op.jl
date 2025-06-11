module test_julia_op

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


# Julia PR #29819
if VERSION >= v"1.1.0-DEV.764"
for x in ('a', "a", ['a'], 1, pi)
    @test identity.(x) == identity(x) == x
end
end # if VERSION >= v"1.1.0-DEV.764"

end # module test_julia_op


module test_julia_op2

using Test

f(op::Union{typeof.((+, -, *, /))...}) = 1

@test f(+) == f(-) == f(*) == f(/) == 1
@test_throws MethodError f(\)

end # module test_julia_op2


module test_julia_op_plus

using Test

module A
    + = 3
end

module B
end

module C
    + = 3
module D
end
end

@test A.:+ == 3
@test B.:+ == Base.:+
@test A.:+ != B.:+
@test C.:+ != C.D.:+

end # module test_julia_op_plus


module test_julia_op_pipe_gt # |>

using Test

@test |>(3, -) == -3
@test (3 |> -) == -3

end # module test_julia_op_pipe_gt # |>


module test_julia_op_in

using Test

struct Q end
struct R end
struct S end
U = Union{Q, R ,S}

struct C end

function Base.in(tup::NTuple{N, U}, ::Type{C}) where N
    tup
end

(q, r, s) = Q(), R(), S()

@test ((q, r, s) in C) == (q, r, s)

end # module test_julia_op_in


module test_julia_op_splat

using Test

s = splat(+)
@test s.f === +
@test s((1, 2)) == 3

end # module test_julia_op_splat
