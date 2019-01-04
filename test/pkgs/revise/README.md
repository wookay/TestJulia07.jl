``` $ julia --project=Example -i
julia> using Revise

julia> using Example

julia> Example.f()
6
```

edit `Example/src/Example.jl`

```
julia> Example.f()
8
```
