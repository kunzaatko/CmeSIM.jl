using CmeSIM
using Documenter

DocMeta.setdocmeta!(CmeSIM, :DocTestSetup, :(using CmeSIM); recursive=true)

makedocs(;
    modules=[CmeSIM],
    authors="Martin Kunz <martinkunz@email.cz> and contributors",
    repo="https://github.com/kunzaatko/CmeSIM.jl/blob/{commit}{path}#{line}",
    sitename="CmeSIM.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://kunzaatko.github.io/CmeSIM.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/kunzaatko/CmeSIM.jl",
)
