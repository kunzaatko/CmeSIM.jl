using Images, AxisArrays
using Base: OneTo
using Unitful

function SIMAcquisition( # {{{
    reconstructedimages::AbstractArray{T,3} where {T<:Color},
    unreconstructedimages::AbstractArray{T,3} where {T<:Color},
    acquisitiontimes::AbstractVector{T} where {T<:Unitful.Time},
    NA,
    M,
    marker::FluorophoreMarker,
    pixelsize::Unitful.Length,
)
    for img in [reconstructedimages, unreconstructedimages]
        if !(eltype(img) <: AbstractAGray)
            img = Gray.(img)
        end
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
