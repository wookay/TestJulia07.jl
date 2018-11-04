module test_pkgs_musicmanipulations

using MusicManipulations
using Test

@test pitch_to_name(55) == "G4"
@test pitch_to_name(0) == "C0"
@test pitch_to_name(1) == "C♯0"
@test pitch_to_name(2) == "D0"

end # module test_pkgs_musicmanipulations
