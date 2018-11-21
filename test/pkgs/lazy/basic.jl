module test_pkgs_lazy_basic

using Lazy # c d s
using Test

@test c(:a=>1, :b=>2) == [:a=>1, :b=>2]
@test s(:a=>1, :b=>2) == Set([:a=>1, :b=>2])
@test d(:a=>1, :b=>2) == Dict(:a=>1, :b=>2)

end # module test_pkgs_lazy_basic
