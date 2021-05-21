using Images, AxisArrays
using Base: OneTo
using Unitful: Time, Length, s

struct Acquisition <: AbstractAcquisition # {{{
    "Acquired images"
    images::AxisArray{<:AbstractGray,3}
    "Numerical aperature"
    NA::Real
    "Magnification"
    M::Integer
    "Fluorophore marker"
    marker::FluorophoreMarker
    "Pixel size"
    pixelsize::Length
end # }}}

function Acquisition( # {{{
    images::AbstractArray{<:Color,3},
    acquisitiontimes::AbstractVector{<:Time},
    NA,
    M,
    marker::FluorophoreMarker,
    pixelsize::Length,
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
    images::AbstractArray{<:Color,3},
    acquisitiontimestep::Time,
    NA,
    M,
    marker::FluorophoreMarker,
    pixelsize::Length,
)
    return Acquisition(
        images,
        range(0s; length=size(images, 3), step=acquisitiontimestep),
        NA,
        M,
        marker,
        pixelsize,
    )
end # }}}

times(acquisition::AbstractAcquisition) = acquisition.images[Axis{:time}].val
