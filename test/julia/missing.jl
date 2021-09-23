module test_julia_missing

using Test

@test missing === missing
@test ismissing(missing)
@test skipmissing([missing]) isa Base.SkipMissing{Vector{Missing}}
@test collect(skipmissing([])) == Any[]
@test collect(skipmissing(Union{Missing}[missing])) == Union{}[]
@test collect(skipmissing(Union{Int,Missing}[missing])) == Int[]

@test (missing in []    ) === false
@test (missing in ()    ) === false
@test (missing in Set() ) === false
@test (missing in Set(1)) === false

@test ismissing(missing == missing)
@test ismissing(missing in [missing])
@test ismissing(missing in [1]   )
@test ismissing(missing in (1,)  )

@test missing in keys(Dict(missing => 1))
@test ismissing(missing in values(Dict(1 => missing)))

@test ismissing(missing in collect(keys(Dict(missing => 1))))
@test ismissing(missing in collect(values(Dict(1 => missing))))

end # module test_julia_missing
