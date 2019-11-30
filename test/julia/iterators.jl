module test_julia_iterators_peel

using Test

(a, rest) = Iterators.peel("abc")
@test a == 'a'
@test collect(rest) == ['b', 'c']

@test collect(Iterators.product((1,2), (3,4))) == [(1, 3) (1, 4);  (2, 3)  (2, 4)]

end # module test_julia_iterators_peel


module test_julia_iterators_repeated

using Test
using Base.Iterators: repeated

@test collect(repeated((1,2), 3)) == [(1, 2), (1, 2), (1, 2)]

end # module test_julia_iterators_repeated
