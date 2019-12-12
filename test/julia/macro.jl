module test_julia_macro_emoji

using Test

macro 🤔(f)
    println(f)
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
