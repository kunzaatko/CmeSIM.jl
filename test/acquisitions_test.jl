using CmeSIM
using Test
using Unitful

@testset "acquisitions.jl" begin
    @test begin
        flourophore = CmeSIM.dTomato
        marker = FluorophoreMarker(flourophore)
        marker
    end == FluorophoreMarker(CmeSIM.dTomato, 554u"nm", 581u"nm")
end
