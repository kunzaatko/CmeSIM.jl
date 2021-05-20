using Images, AxisArrays
using Base: OneTo
using Unitful

# TODO: Make this be generic over type of SIM acquisition like so
# SIMAcquisition{T} where T <: AbstractSIMType <19-05-21, kunzaatko> #
struct SIMAcquisition <: AbstractAcquisition # {{{
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
end # }}}

function SIMAcquisition( # {{{
    reconstructedimages::AbstractArray{T,3} where {T<:Color},
    unreconstructedimages::AbstractArray{T,3} where {T<:Color},
    acquisitiontimes::AbstractVector{T} where {T<:Unitful.Time},
    NA,
    M,
    marker::FluorophoreMarker,
    pixelsize::Unitful.Length,
)
    if !(eltype(reconstructedimages) <: AbstractGray)
        reconstructedimages = Gray.(reconstructedimages)
    end

    if !(eltype(unreconstructedimages) <: AbstractGray)
        unreconstructedimages = Gray.(unreconstructedimages)
    end

    # FIX: Add check for acquisition times having the same size <19-05-21, kunzaatko> #
    # TODO: This should be generic over AbstractSIMType <19-05-21, kunzaatko> #
    # TODO: x and y axes should be indexed by length instead of index <19-05-21, kunzaatko> #
    unreconstructedimages_axis = AxisArray(
        unreconstructedimages,
        Axis{:x}(OneTo(size(unreconstructedimages, 1))),
        Axis{:y}(OneTo(size(unreconstructedimages, 2))),
        Axis{:time}(acquisitiontimes),
    )

    # TODO: This should make an average for the times of acquisition for the unreconstructed sequence that soruced this <19-05-21, kunzaatko> #
    # TODO: x and y axes should be indexed by length instead of index <19-05-21, kunzaatko> #
    reconstructedimages_axis = AxisArray(reconstructedimages, :x, :y, :time)

    return SIMAcquisition(
        reconstructedimages_axis, unreconstructedimages_axis, NA, M, marker, pixelsize
    )
end # }}}

function SIMAcquisition( # {{{
    reconstructedimages::AbstractArray{T,3} where {T<:Color},
    unreconstructedimages::AbstractArray{T,3} where {T<:Color},
    acquisitiontimestep::Unitful.Time,
    NA,
    M,
    marker::FluorophoreMarker,
    pixelsize::Unitful.Length,
)
    return SIMAcquisition(
        reconstructedimages,
        unreconstructedimages,
        range(0u"s"; length=size(unreconstructedimages, 3), step=acquisitiontimestep),
        NA,
        M,
        marker,
        pixelsize,
    )
end # }}}

function times(acquisition::SIMAcquisition; images=:unreconstructedimages) # {{{
    if images == :unreconstructedimages
        return acquisition.unreconstructedimages[Axis{:time}].val
    elseif images == :reconstructedimages
        return acquisition.reconstructedimages[Axis{:time}].val
    else
        # TODO: error handling when not reconstructed or unreconstructed <20-05-21, kunzaatko> #
        return error("Must be reconstructed or unreconstructed")
    end
end # }}}
