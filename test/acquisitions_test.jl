using CmeSIM.FluorophoreMarkers
using CmeSIM.Acquisitions
using Test
using Unitful: s, μm, nm
using Images

FM = FluorophoreMarkers

@testset "Acquisition" begin

    @testset "fluorophore_marker.jl" begin

        @test begin
            marker = FluorophoreMarker(FM.dTomato)
            marker == FluorophoreMarker(FM.dTomato, 554nm, 581nm)
        end

        @test begin
            all(
                [typeof(FluorophoreMarker(ins)) for ins in instances(Fluorophore)] .== FluorophoreMarker,
            )
        end

        global marker = FluorophoreMarker(FM.EGFP)

    end

    @testset "acquisition.jl" begin
        images = unreconstructedimages
        images_rgb = unreconstructedimages_rgb

        @test begin
            acquisitiontimes = range(0s, 4s, 18)
            typeof(Acquisition(images, acquisitiontimes, NA, M, marker, pixelsize)) ==
            Acquisition
        end

        @test begin
            typeof(Acquisition(images_rgb, 0.1s, NA, M, marker, pixelsize)) == Acquisition
        end

        global acquisition = Acquisition(images, 0.1s, NA, M, marker, pixelsize)

        @test begin
            all(times(acquisition) .== range(0s; length=18, step=0.1s))
        end

    end

    @testset "simacquisition.jl" begin
        @test begin
            acquisitiontimes = range(0s, 4s, 18)
            typeof(SIMAcquisition(
                reconstructedimages_rgb,
                unreconstructedimages_rgb,
                acquisitiontimes,
                NA,
                M,
                marker,
                pixelsize,
            )) <: Acquisitions.AbstractAcquisition
        end

        @test begin
            typeof(SIMAcquisition(
                reconstructedimages, unreconstructedimages, 0.1s, NA, M, marker, pixelsize
            )) == SIMAcquisition
        end

        global simacquisition = SIMAcquisition(
            reconstructedimages, unreconstructedimages, 0.1s, NA, M, marker, pixelsize
        )

        @test begin
            all(times(simacquisition) .== range(0s; length=18, step=0.1s))
        end

    end

end
