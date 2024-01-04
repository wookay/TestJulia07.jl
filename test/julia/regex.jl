module test_julia_regex

using Test

s_html = """
<A HREF="a.html">hello(HELLO)</A>
<A HREF="b.html">world(WORLD)</A>
"""

const re_tag = r"""<A HREF="(?<page>[\w.]*)">\w*(?<inner>[\w()]*)</A>"""

matches = collect(eachmatch(re_tag, s_html))

@test matches[1][:page] == "a.html"
@test matches[1][:inner] == "(HELLO)"
@test matches[2][:page] == "b.html"
@test matches[2][:inner] == "(WORLD)"


const re_num_or_not = r"([^\d]|[\d]+)"
str = "hello 2024"
matches2 = collect(eachmatch(re_num_or_not, str, overlap=false))
@test last(matches2).match == "2024"

end # module test_julia_regex
