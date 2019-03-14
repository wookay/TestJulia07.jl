module test_julia_environment_variables

using Test

julia_bin = joinpath(Sys.BINDIR, Base.julia_exename())

load_path = read(`$julia_bin -e 'println(Base.LOAD_PATH)'`, String)
@test startswith(load_path, """["@",""")

empty_load_path = read(setenv(`$julia_bin -e 'println(Base.LOAD_PATH)'`, Dict("JULIA_LOAD_PATH"=>"")), String)
@test empty_load_path == "String[]\n"

depot_path = read(`$julia_bin -e 'println(Base.DEPOT_PATH)'`, String)
@test depot_path == string(repr(Base.DEPOT_PATH), "\n")

empty_depot_path = read(setenv(`$julia_bin -e 'println(Base.DEPOT_PATH)'`, Dict("JULIA_DEPOT_PATH"=>"")), String)
@test empty_depot_path == """[""]\n"""

end # module test_julia_environment_variables
