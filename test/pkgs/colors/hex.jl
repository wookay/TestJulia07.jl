module test_pkgs_colors_hex

using Test
using Colors

@test hex(RGB(255 .\ (184, 59, 79)...))  == "B83B4F"
@test hex(RGB((184, 59, 79) ./ 255 ...)) == "B83B4F"

end # module test_pkgs_colors_hex
