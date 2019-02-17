module test_pkgs_morton_cartesian

using Test
using Morton

@test cartesian2morton.(morton2cartesian.(1:16)) == 1:16
@test cartesian2morton.(morton2cartesian.(1:32)) == 1:32

end # module test_pkgs_morton_cartesian
