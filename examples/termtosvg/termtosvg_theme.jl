using LightXML
using Colors

docstr = read("basic.itermcolors", String)
xdoc = parse_string(docstr)
xroot = root(xdoc)
nodes = child_nodes(xroot)
top = collect(nodes)[2]

key = nothing
for keydictnode in child_nodes(top)
    if name(keydictnode) == "key"
        global key
        key = content(keydictnode)
    elseif name(keydictnode) == "dict"
        keyname = nothing
        colors = []
        for dictnode in child_nodes(keydictnode)
            if name(dictnode) == "key"
                keyname = content(dictnode)
            elseif name(dictnode) == "real"
                if endswith(keyname, "Component")
                    color = parse(Float64, content(dictnode))
                    push!(colors, color)
                end
            end
        end
        if startswith(key, "Ansi")
            n = split(key, ' ')[2]
            color = hex(BGR(colors[2:end]...))
            println("color", n, " = #", color)
        end
    end
end
