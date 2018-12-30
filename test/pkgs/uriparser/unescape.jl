module test_pkgs_uriparser_unescape

using URIParser
using Test

@test URIParser.unescape("%EC%99%95%ED%8F%89") == "왕평"

end # module test_pkgs_uriparser_unescape
