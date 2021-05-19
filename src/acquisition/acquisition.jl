using Images, AxisArrays
using Base: OneTo
using Unitful

function Acquisition( # {{{
    images::AbstractArray{T,3} where {T<:Color},
    acquisitiontimes::AbstractVector{T} where {T<:Unitful.Time},
    NA,
    M,
    marker::FluorophoreMarker,
    pixelsize::Unitful.Length,
)
    if !(eltype(images) <: AbstractGray)
        images = Gray.(images)
    end
    images_axis = AxisArray(
        images,
        Axis{:x}(OneTo(size(images, 1))),
        Axis{:y}(OneTo(size(images, 2))),
        Axis{:time}(acquisitiontimes),
    )
    return Acquisition(images_axis, NA, M, marker, pixelsize)
end # }}}

function Acquisition( # {{{
    images::AbstractArray{T,3} where {T<:Color},
    acquisitiontimestep::Unitful.Time,
    NA,
    M,
    marker::FluorophoreMarker,
    pixelsize::Unitful.Length,
)
    return Acquisition(
        images,
        range(0u"s"; length=size(images, 3), step=acquisitiontimestep),
        NA,
        M,
        marker,
        pixelsize,
    )
end # }}}
