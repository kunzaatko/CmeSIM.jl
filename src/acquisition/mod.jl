using AxisArrays: AxisArray

include("./fluorophore_marker.jl")

export Fluorophore, FluorophoreMarker, TIRFAcquisition, SIMTIRFAcquisition

abstract type AbstractAcquisition end

struct TIRFAcquisition
    "Acquired images"
    image::AxisArray
    "Numerical aperature"
    NA::Real
    "Magnification"
    M::Integer
    "Fluorophore marker"
    marker::FluorophoreMarker
end

# TIRFAcquisition(filename::AbstractString, acquisitiontimes::AbstractArray NA::Real, M::Integer) =

struct SIMTIRFAcquisition
    "Acquired reconstructed images"
    reconstructedimage::AxisArray
    "Acquired unreconstructed images"
    unreconstructedimage::AxisArray
    "Numerical aperature"
    NA::Real
    "Magnification"
    M::Integer
end
