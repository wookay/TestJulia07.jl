function fizzbuzz(n)
    fiz(x) = "Fizz"
    buzzz(x::String) = string(x, "Buzz")
    buzzz(x) = "Buzz"
    g = identity
    foreach(f -> (iszero∘%)(n, (length∘string)(f)) && (g=f∘g), (fiz, buzzz))
    g(n)
end

(println ∘ fizzbuzz).(1:20)
