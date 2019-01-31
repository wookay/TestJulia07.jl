module test_pkgs_musicmanipulations

using Test
using MusicManipulations

c4 = Note(60, 0, 0, 1)
@test pitch_to_name(c4.pitch) == "C4"

end # module test_pkgs_musicmanipulations
