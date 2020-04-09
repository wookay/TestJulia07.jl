module test_julia_asyncevent_timedwait

using Test

@test timedwait(() -> true, 0.0) === :ok

state = false
@test timedwait(() -> state, 0.0) === :timed_out

end # module test_julia_asyncevent_timedwait
