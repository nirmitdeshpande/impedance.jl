#file to create package called impedance.jl

using PkgTemplates

t=Template(;

    user="nirmitdeshpande",
    License="MIT",
    authors=["Nirmit Deshpande, Valentin Sulzer"],

)


generate("impedance.jl",t)
