module test_julia_multiple_dispatch

using Test

f(::Int) = 2
f(::String) = "s"

@test length(methods(f)) == 2

@test Base.return_types(f, (Int,)) == Any[Int]
@test Base.return_types(f, (String,)) == Any[String]

m = first(methods(f, [String]))
Base.delete_method(m)

@test length(methods(f)) == 1

end # module test_julia_multiple_dispatch


module test_julia_multiple_dispatch_dc

using Test
using DataLogger

# http://gall.dcinside.com/mgallery/board/view/?id=github&no=1628

abstract type 사람 end

struct 학생 <: 사람
    name::String
    age::UInt8
end

struct 손님 <: 사람
    name::String
    age::UInt8
end

struct 예비군 <: 사람
    name::String
    age::UInt8
end

function study(나::사람)
    println(나.name, "(", 나.age, ")는 ", nameof(typeof(나)), "으로서 공부를 합니다.")
end

function buy_goods(나::사람)
    println(나.name, "(", 나.age, ")는 ", nameof(typeof(나)), "으로서 물건을 삽니다.")
end

function train(나::사람)
    println(나.name, "(", 나.age, ")는 ", nameof(typeof(나)), "으로서 훈련을 합니다.")
end

output = DataLogger.read_stdout() do
    name, age = "다메즈마", 27
    buy_goods(손님(name, age))
    study(학생(name, age))
    train(예비군(name, age))

    buy_goods(학생(name, age))
end

@test output == """
다메즈마(27)는 손님으로서 물건을 삽니다.
다메즈마(27)는 학생으로서 공부를 합니다.
다메즈마(27)는 예비군으로서 훈련을 합니다.
다메즈마(27)는 학생으로서 물건을 삽니다.
"""

end # module test_julia_multiple_dispatch_dc
