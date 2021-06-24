module test_julia_stdlib_unicode

using Test
using Unicode

@test Unicode.normalize("거북이", :NFD) == "거북이"
@test Unicode.normalize("거북이", :NFC) == "거북이"

end # module test_julia_stdlib_unicode
