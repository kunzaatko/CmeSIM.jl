using CmeSIM.Tracks
using CmeSIM.Acquisitions
using Test
using Unitful: s, μm, nm
using Images

@testset "Track" begin

    @testset "mod.jl" begin

        acquisitiontimes = times(acquisition)[9:10]
        @test begin
            typeof(Track([43.45, 45.67], [82.1, 75.98], acquisition, acquisitiontimes)) == Track
        end

        @test begin
            typeof(Track([43.45, 45.67], [82.1, 75.98], acquisition, [12, 13])) == Track
        end

        simacquisitiontimes = times(acquisition)[9:10]
        @test begin
            typeof(SIMTrack([43.45, 45.67], [82.1, 75.98], simacquisition, simacquisitiontimes)) == SIMTrack
        end

        @test begin
            typeof(SIMTrack([43.45, 45.67], [82.1, 75.98], simacquisition, [12, 13])) == SIMTrack
        end

    end

end
