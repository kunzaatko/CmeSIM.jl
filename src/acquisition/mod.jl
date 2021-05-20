module Acquisitions
using AxisArrays, Images
export Acquisition, SIMAcquisition, times, FluorophoreMarkers

using ..FluorophoreMarkers

abstract type AbstractAcquisition end

include("./acquisition.jl")
include("./simacquisition.jl")

end
