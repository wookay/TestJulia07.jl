module test_stdlib_libdl

using Test
using Libdl

libllvm_paths = filter(Libdl.dllist()) do lib
    occursin("LLVM", basename(lib))
end

filename = basename(first(libllvm_paths))
# Sys.iswindows()
(name, ext) = splitext(filename)
@test startswith(name, "libLLVM")

end # module test_stdlib_libdl
