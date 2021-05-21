module Tracks
using OffsetArrays, Images, Unitful
export Track, SIMTrack

using ..Acquisitions

abstract type AbstractTrack end

struct Track <: AbstractTrack # {{{
    x::AbstractVector{<:Real}
    y::AbstractVector{<:Real}
    view::AxisArray{A,1} where {A<:OffsetArray{<:AbstractGray}}
end # }}}

# TODO: Should be generic over the SIMacquisition type <20-05-21, kunzaatko> #
struct SIMTrack <: AbstractTrack # {{{
    x::AbstractVector{<:Real}
    y::AbstractVector{<:Real}
    view::AxisArray{A,1} where {A<:OffsetArray{<:AbstractGray}}
    view_reconstructed::AxisArray{A,1} where {A<:OffsetArray{<:AbstractGray}}
end # }}}

function Track( # {{{
    x, y, acquisition::Acquisition, times::AbstractVector{<:Unitful.Time}
)
    # TODO: Add check for times, x and y having the same lengths <20-05-21, kunzaatko> #
    x_offsets, y_offsets = round.(Integer, x), round.(Integer, y)
    view = AxisArray(
        [
            OffsetArray(
                acquisition.images[Axis{:x}(:), Axis{:y}(:), Axis{:time}(t)],
                OffsetArrays.Origin(-x_offset, -y_offset),
            ) for (t, x_offset, y_offset) in zip(times, x_offsets, y_offsets)
        ],
        Axis{:time}(times),
    )
    return Track(x, y, view)
end # }}}

function Track(x, y, acquisition::Acquisition, frames::AbstractVector{<:Integer})
    return Track(x, y, acquisition, times(acquisition)[frames])
end

function SIMTrack( # {{{
    x, y, acquisition::SIMAcquisition, times::AbstractVector{<:Unitful.Time}
)
    x_offsets, y_offsets = round.(Integer, x), round.(Integer, y)
    view = AxisArray(
        [
            OffsetArray(
                acquisition.unreconstructedimages[Axis{:x}(:), Axis{:y}(:), Axis{:time}(t)],
                OffsetArrays.Origin(-x_offset, -y_offset),
            ) for (t, x_offset, y_offset) in zip(times, x_offsets, y_offsets)
        ],
        Axis{:time}(times),
    )
    # FIX: This should be meaningfull times as they will be defined in the constructor <20-05-21, kunzaatko> #
    view_reconstructed = AxisArray(
        [OffsetArray(Gray.(zeros(3, 3)), OffsetArrays.Origin(-1, -1)) for _ in [1, 2]],
        Axis{:time}([1u"s", 2u"s"]),
    ) # DUMMY instance
    return SIMTrack(x, y, view, view_reconstructed)
end # }}}

function SIMTrack(x, y, acquisition::SIMAcquisition, frames::AbstractVector{<:Integer})
    return SIMTrack(x, y, acquisition, times(acquisition)[frames])
end

end
