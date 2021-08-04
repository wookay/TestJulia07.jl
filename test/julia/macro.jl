module test_julia_macro_invocation

using Test

macro m()
    (__module__, __source__)
end

(m, node) = @m
@test m === Main.test_julia_macro_invocation
@test node === LineNumberNode(9, Symbol(@__FILE__))

end # module test_julia_macro_invocation


module test_julia_macro_emoji

using Test

macro 🤔(f)
    # println(f)
    f
end

function 🍞(x)
    x, x
end

function 🚗(x)
    x
end

f = @🤔 🍞 ∘ 🚗
@test f('🌀') == ('🌀', '🌀')

end # module test_julia_macro_emoji


module test_julia_macro_var_str

using Test

struct A
    var"local"
end

a = A(1)
@test a.local == a.var"local" == getproperty(a, :local)

end # module test_julia_macro_var_str
