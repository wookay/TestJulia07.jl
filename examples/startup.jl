# ~/.julia/config/startup.jl

let
    ESC = '\033'
    OSC = ']'    # Operating System Control code
    Ps  = 0      # Change Icon Name and Window Title to Pt
    BEL = '\007'
    f(Pt) = string(ESC, OSC, Ps, ';', Pt, BEL)
    commit_date = (first ∘ split)(Base.GIT_VERSION_INFO.date_string)
    (print ∘ f)("Julia $VERSION ($commit_date)")
end
