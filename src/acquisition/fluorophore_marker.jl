using Unitful

# TODO: Instead of an enum, this should be a symbol, which is more natural in julia. <18-05-21, kunzaatko> #
# @enum Fluorophore {{{
@enum Fluorophore begin
    # [P4-3]
    # BFP is a basic (constitutively fluorescent) blue fluorescent protein published in 1996, derived from Aequorea victoria.
    BFP
    # EBFP is a basic (constitutively fluorescent) blue fluorescent protein published in 1998, derived from Aequorea victoria.
    EBFP
    # [Y66W]
    # CFP is a basic (constitutively fluorescent) cyan fluorescent protein published in 1994, derived from Aequorea victoria.
    CFP
    # [enhanced GFP, GFPmut1]
    # EGFP is a basic (constitutively fluorescent) green fluorescent protein published in 1996, derived from Aequorea victoria. It is reported to be a rapidly-maturing weak dimer with moderate acid sensitivity.
    EGFP
    # [wtGFP, GFP, gfp10, Green Fluorescent Protein]
    # avGFP is a basic (constitutively fluorescent) long stokes shift fluorescent protein published in 1992, derived from Aequorea victoria. It has low acid sensitivity.
    avGFP
    # dTomato is a basic (constitutively fluorescent) orange fluorescent protein published in 2004, derived from Discosoma sp.. It is reported to be a somewhat slowly-maturing dimer with low acid sensitivity.     dTomato
    dTomato
    # tdTomato is a basic (constitutively fluorescent) orange fluorescent protein published in 2004, derived from Discosoma sp.. It is reported to be a somewhat slowly-maturing tandem dimer with low acid sensitivity.
    tdTomato
    # [drFP583, discRFP, RFP, DsRed1]
    # DsRed is a basic (constitutively fluorescent) red fluorescent protein published in 1999, derived from Discosoma sp..
    DsRed
    # TagRFP is a basic (constitutively fluorescent) red fluorescent protein published in 2007, derived from Entacmaea quadricolor. It has very low acid sensitivity.
    TagRFP
    # [mRFP]
    # mRFP1 is a basic (constitutively fluorescent) red fluorescent protein published in 2002, derived from Discosoma sp.. It is reported to be a somewhat slowly-maturing monomer with low acid sensitivity.
    mRFP1
    # mCherry is a basic (constitutively fluorescent) red fluorescent protein published in 2004, derived from Discosoma sp.. It is reported to be a very rapidly-maturing monomer with low acid sensitivity.
    mCherry
    # TurboRFP is a basic (constitutively fluorescent) orange fluorescent protein published in 2007, derived from Entacmaea quadricolor. It has low acid sensitivity.
    TurboRFP
    # mRuby2 is a basic (constitutively fluorescent) red fluorescent protein published in 2012, derived from Entacmaea quadricolor. It has moderate acid sensitivity.
    mRuby2
    # [mNG]
    # mNeonGreen is a basic (constitutively fluorescent) green/yellow fluorescent protein published in 2013, derived from Branchiostoma lanceolatum. It is reported to be a very rapidly-maturing monomer with moderate acid sensitivity.
    mNeonGreen
    # CyOFP1 is a basic (constitutively fluorescent) long stokes shift fluorescent protein published in 2016, derived from Entacmaea quadricolor. It is reported to be a very rapidly-maturing monomer with moderate acid sensitivity.
    CyOFP1
    # mScarlet-I is a basic (constitutively fluorescent) red fluorescent protein published in 2016, derived from synthetic construct. It is reported to be a rapidly-maturing monomer with moderate acid sensitivity.
    mScarlet_I # FCHO2
    # mScarlet is a basic (constitutively fluorescent) red fluorescent protein published in 2016, derived from synthetic construct. It has moderate acid sensitivity.
    mScarlet
end
# }}}

# struct FluorophoreMarker {{{
struct FluorophoreMarker
    fluorophore::Fluorophore
    exλ::Unitful.Length
    emλ::Unitful.Length
end
# }}}

# FluorophoreMarker(fluorophore::Fluorophore) {{{
function FluorophoreMarker(fluorophore::Fluorophore)
    if fluorophore == BFP::Fluorophore
        exλ = 381u"nm"
        emλ = 440u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == EBFP::Fluorophore
        exλ = 380u"nm"
        emλ = 440u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == CFP::Fluorophore
        exλ = 456u"nm"
        emλ = 475u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == EGFP::Fluorophore
        exλ = 488u"nm"
        emλ = 507u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == avGFP::Fluorophore
        exλ = 488u"nm"
        emλ = 509u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == dTomato::Fluorophore
        exλ = 554u"nm"
        emλ = 581u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == tdTomato::Fluorophore
        exλ = 554u"nm"
        emλ = 581u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == DsRed::Fluorophore
        exλ = 558u"nm"
        emλ = 583u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == TagRFP::Fluorophore
        exλ = 555u"nm"
        emλ = 584u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == mRFP1::Fluorophore
        exλ = 584u"nm"
        emλ = 607u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == mCherry::Fluorophore
        exλ = 587u"nm"
        emλ = 610u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == TurboRFP::Fluorophore
        exλ = 553u"nm"
        emλ = 574u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == mRuby2::Fluorophore
        exλ = 559u"nm"
        emλ = 600u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == mNeonGreen::Fluorophore
        exλ = 506u"nm"
        emλ = 517u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == cyofp1::Fluorophore
        exλ = 497u"nm"
        emλ = 589u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == mScarlet_I::Fluorophore
        exλ = 569u"nm"
        emλ = 593u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
    if fluorophore == mScarlet::Fluorophore
        exλ = 569u"nm"
        emλ = 594u"nm"
        return FluorophoreMarker(fluorophore, exλ, emλ)
    end
end
# }}}
