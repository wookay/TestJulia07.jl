module test_stdlib_libdl

using Test
using Libdl

libllvm_paths = filter(Libdl.dllist()) do lib
    occursin("LLVM", basename(lib))
end

filename = basename(first(libllvm_paths))
if Sys.iswindows()
    @test filename == "LLVM.dll"
else
    (name, ext) = splitext(filename)
    @test startswith(name, "libLLVM")
end

end # module test_stdlib_libdl
