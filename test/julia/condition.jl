module test_julia_condition

using Test

closenotify = Condition()
Timer(t -> notify(closenotify), 0.01)
wait(closenotify)
@test true

end # module test_julia_condition
