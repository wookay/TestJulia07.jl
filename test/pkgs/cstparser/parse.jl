module test_pkgs_cstparser_parse

using Test
using CSTParser # ParseState
using CSTParser: BinarySyntaxOpCall, AbstractEXPR, Quotenode
using CSTParser: IDENTIFIER, OPERATOR, EXPR, PUNCTUATION
using CSTParser.Tokenize: Tokens

for T in (EXPR{Quotenode}, BinarySyntaxOpCall)
    @eval begin
        function Base.:(==)(l::$T, r::$T)
            props = fieldnames($T)
            getproperty.(Ref(l), props) == getproperty.(Ref(r), props)
        end
    end
end

expr = CSTParser.parse("UIColor.red")
@test expr isa BinarySyntaxOpCall
@test expr isa AbstractEXPR
id, op, node = expr
@test id == IDENTIFIER(7, 1:7, "UIColor")
@test op == OPERATOR(1, 1:1, Tokens.DOT, false)
@test node == EXPR{Quotenode}([IDENTIFIER(3, 1:3, "red")], 3, 1:3)
@test expr == BinarySyntaxOpCall(id, op, node)

expr = CSTParser.parse("view.addSubview(subview)")
opcall, lparen, id, rparen = expr
@test opcall.arg1 == IDENTIFIER(4, 1:4, "view")
@test opcall.op == OPERATOR(1, 1:1, Tokens.DOT, false)
@test opcall.arg2 == EXPR{Quotenode}([IDENTIFIER(10, 1:10, "addSubview")], 10, 1:10)
@test opcall == BinarySyntaxOpCall(opcall.arg1, opcall.op, opcall.arg2)
@test lparen == PUNCTUATION(Tokens.LPAREN, 1, 1:1)
@test id == IDENTIFIER(7, 1:7, "subview")
@test rparen == PUNCTUATION(Tokens.RPAREN, 1, 1:1)

end # module test_pkgs_cstparser_parse
