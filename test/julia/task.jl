module test_julia_task

using Test

t = @async begin
    return true
end
@test fetch(t)

t = @async begin
    return "hello"
end
@test fetch(t) == "hello"

t = @async "world"
@test fetch(t) == "world"

@test endswith(task_local_storage(:SOURCE_PATH), "task.jl")

end # module test_julia_task
