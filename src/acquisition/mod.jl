include("./fluorophore_marker.jl")

using AxisArrays, Images

export Fluorophore, FluorophoreMarker, Acquisition, SIMAcquisition

abstract type AbstractAcquisition end

struct Acquisition <: AbstractAcquisition
    "Acquired images"
    image::AxisArray{T,3} where {T<:AbstractGray}
    "Numerical aperature"
    NA::Real
    "Magnification"
    M::Integer
    "Fluorophore marker"
    marker::FluorophoreMarker
    "Pixel size"
    pixelsize::Unitful.Length
end

include("./acquisition.jl")

# TODO: Make this be generic over type of SIM acquisition like so
# SIMAcquisition{T} where T <: AbstractSIMType <19-05-21, kunzaatko> #
struct SIMAcquisition <: AbstractAcquisition
    "Acquired reconstructed images"
    reconstructedimages::AxisArray{T,3} where {T<:AbstractGray}
    "Acquired unreconstructed images stored with there acquisition times and orientations"
    unreconstructedimages::AxisArray{T,3} where {T<:AbstractGray}
    "Numerical aperature"
    NA::Real
    "Magnification"
    M::Unsigned
    "Fluorophore marker"
    marker::FluorophoreMarker
    "Pixel size"
    pixelsize::Unitful.Length
end

include("./simacquisition.jl")
