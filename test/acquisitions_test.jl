using CmeSIM
using Test
using Unitful: s, μm, nm
using Images

@testset "Acquisition" begin

    @testset "fluorophore_marker.jl" begin
        @test begin
            flourophore = CmeSIM.dTomato
            marker = FluorophoreMarker(flourophore)
            marker
        end == FluorophoreMarker(CmeSIM.dTomato, 554nm, 581nm)
    end

    @testset "simacquisition.jl" begin
        unreconstructedimages = load("./resources/test_unreconstructed.tiff")
        reconstructedimages = load("./resources/test_reconstructed.tiff")
        @test begin
            acquisitiontimes = range(0s, 4s, 18)
            NA = 1.49
            M = 109
            pixelsize = 10μm
            typeof(SIMAcquisition(
                reconstructedimages,
                unreconstructedimages,
                acquisitiontimes,
                NA,
                M,
                pixelsize,
            )) <: CmeSIM.AbstractAcquisition
        end
        @test begin
            unreconstructedimages = load("./resources/test_unreconstructed.tiff")
            reconstructedimages = load("./resources/test_reconstructed.tiff")
            acquisitiontimes = range(0s, 4s, 18)
            NA = 1.49
            M = 109
            pixelsize = 10μm
            typeof(SIMAcquisition(
                reconstructedimages,
                unreconstructedimages,
                0.1s,
                NA,
                M,
                pixelsize,
            )) <: CmeSIM.AbstractAcquisition
        end
    end
end
