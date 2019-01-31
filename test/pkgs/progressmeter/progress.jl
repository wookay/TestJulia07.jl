module test_pkgs_progressmeter_progress

using Test
using ProgressMeter

n = 10 
p = ProgressMeter.Progress(n, desc="Loading ", color=:normal)
for i = 1:n
    sleep(rand(0.02:0.01:0.1))
    ProgressMeter.next!(p)
end
ProgressMeter.finish!(p)
# ProgressMeter.move_cursor_up_while_clearing_lines(p.output, p.numprintedvalues+1)

end # module test_pkgs_progressmeter_progress
