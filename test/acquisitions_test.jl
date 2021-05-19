using CmeSIM
using Test
using Unitful: s, μm, nm
using Images

@testset "Acquisition" begin

    @testset "fluorophore_marker.jl" begin
        @test begin
            flourophore = CmeSIM.dTomato
            marker = FluorophoreMarker(flourophore)
            marker == FluorophoreMarker(CmeSIM.dTomato, 554nm, 581nm)
        end
    end

    @testset "simacquisition.jl" begin
        unreconstructedimages = load("./resources/test_unreconstructed.tiff")
        reconstructedimages = load("./resources/test_reconstructed.tiff")
        NA = 1.49
        M = 109
        marker = FluorophoreMarker(CmeSIM.BFP)
        pixelsize = 10μm

        @test begin
            acquisitiontimes = range(0s, 4s, 18)
            typeof(SIMAcquisition(
                reconstructedimages,
                unreconstructedimages,
                acquisitiontimes,
                NA,
                M,
                marker,
                pixelsize,
            )) <: CmeSIM.AbstractAcquisition
        end

        @test begin
            typeof(SIMAcquisition(
                reconstructedimages, unreconstructedimages, 0.1s, NA, M, marker, pixelsize
            )) == SIMAcquisition
        end
    end

    @testset "acquisition.jl" begin
        images = load("./resources/test_unreconstructed.tiff")
        NA = 1.49
        M = 109
        marker = FluorophoreMarker(CmeSIM.BFP)
        pixelsize = 10μm

        @test begin
            acquisitiontimes = range(0s, 4s, 18)
            typeof(Acquisition(images, acquisitiontimes, NA, M, marker, pixelsize)) ==
            Acquisition
        end

        @test begin
            typeof(Acquisition(images, 0.1s, NA, M, marker, pixelsize)) ==
            Acquisition
        end

    end
end
