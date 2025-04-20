module test_julia_macro_invocation

using Test

macro m()
    (__module__, __source__)
end

(m, node) = @m
@test m === test_julia_macro_invocation
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


module test_julia_macro_hygiene

using Test

macro bar_x()
    :(local x = 0)
end

function bar()
    local x = 1
    @bar_x
    return x
end

@test bar() == 1

# https://docs.julialang.org/en/v1/manual/metaprogramming/#Hygiene
macro foo_esc_x()
    esc(:(local x = 0))
end

function foo()
    local x = 1
    @foo_esc_x
    return x
end

@test foo() == 0

end # module test_julia_macro_hygiene


module test_julia_macro_UndefVarError

using Test

macro foo_arg()
    arg # global
end

arg = 42
@test @foo_arg() == 42

macro bar_arg()
    arg_err # global UndefVarError
end

@test_throws LoadError Meta.eval(:( @bar_arg ))

@test_throws LoadError Meta.eval(quote
    function bar()
        @bar_arg
    end
end)

end # module test_julia_macro_UndefVarError


module test_julia_macro_passing_variable

using Test

macro foo_passing1(arg)
    local esc(num) = 42
    esc(arg)
end

macro foo_passing2(arg)
    quote
        local num = 42
        $arg
    end
end

@test @foo_passing1(num) == @foo_passing2(num) == 42

end # module test_julia_macro_passing_variable


module test_julia_macro_say_the_word

using Test

macro bar_say(arg)
    esc(quote
        w = $arg
        w
    end)
end

function bar()
    words = []
    for word in ("hello", "world")
        r = @bar_say(word)
        push!(words, r)
    end
    words
end

@test bar() == ["hello", "world"]

end # module test_julia_macro_say_the_word


module test_julia_macro_to_macro

using Test

macro foo(sym)
    quote
        ($sym = 42,)
    end
end

function foo_syms()
    ret_vals = []
    syms = (:hello, :world)
    for op in syms
        foo_macro = Symbol("@foo")
        expr = Expr(:macrocall, foo_macro, @__LINE__, op)
        push!(ret_vals, eval(expr))
    end
    ret_vals
end

@test foo_syms() == [(hello = 42,), (world = 42,)]

end # module test_julia_macro_to_macro
