using CmeSIM: Acquisitions, FluorophoreMarkers
using Test
using Images
using Unitful: μm

@testset "CmeSIM.jl" begin
    global unreconstructedimages = load("./resources/test_unreconstructed.tiff")
    global unreconstructedimages_rgb = load("./resources/test_unreconstructed_rgb.tiff")
    global reconstructedimages = load("./resources/test_reconstructed.tiff")
    global reconstructedimages_rgb = load("./resources/test_reconstructed_rgb.tiff")
    global NA = 1.49
    global M = 109
    global pixelsize = 10μm

    include("./acquisitions_test.jl")
    include("./track_test.jl")
end
