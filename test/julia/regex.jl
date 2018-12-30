module test_julia_regex

using Test

s = """
<A HREF="a.html">hello(HELLO)</A>
<A HREF="b.html">world(WORLD)</A>
"""

re = r"""<A HREF="(?<page>[\w.]*)">\w*(?<inner>[\w()]*)</A>"""

matches = collect(eachmatch(re, s))

@test matches[1][:page] == "a.html"
@test matches[1][:inner] == "(HELLO)"
@test matches[2][:page] == "b.html"
@test matches[2][:inner] == "(WORLD)"

end # module test_julia_regex
