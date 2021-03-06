module FluorophoreMarkers
using Unitful

export FluorophoreMarker, Fluorophore

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
    ex??::Unitful.Length
    em??::Unitful.Length
end
# }}}

# FluorophoreMarker(fluorophore::Fluorophore) {{{
function FluorophoreMarker(fluorophore::Fluorophore)
    if fluorophore == BFP::Fluorophore
        ex?? = 381u"nm"
        em?? = 440u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == EBFP::Fluorophore
        ex?? = 380u"nm"
        em?? = 440u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == CFP::Fluorophore
        ex?? = 456u"nm"
        em?? = 475u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == EGFP::Fluorophore
        ex?? = 488u"nm"
        em?? = 507u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == avGFP::Fluorophore
        ex?? = 488u"nm"
        em?? = 509u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == dTomato::Fluorophore
        ex?? = 554u"nm"
        em?? = 581u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == tdTomato::Fluorophore
        ex?? = 554u"nm"
        em?? = 581u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == DsRed::Fluorophore
        ex?? = 558u"nm"
        em?? = 583u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == TagRFP::Fluorophore
        ex?? = 555u"nm"
        em?? = 584u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == mRFP1::Fluorophore
        ex?? = 584u"nm"
        em?? = 607u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == mCherry::Fluorophore
        ex?? = 587u"nm"
        em?? = 610u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == TurboRFP::Fluorophore
        ex?? = 553u"nm"
        em?? = 574u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == mRuby2::Fluorophore
        ex?? = 559u"nm"
        em?? = 600u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == mNeonGreen::Fluorophore
        ex?? = 506u"nm"
        em?? = 517u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == CyOFP1::Fluorophore
        ex?? = 497u"nm"
        em?? = 589u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == mScarlet_I::Fluorophore
        ex?? = 569u"nm"
        em?? = 593u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
    if fluorophore == mScarlet::Fluorophore
        ex?? = 569u"nm"
        em?? = 594u"nm"
        return FluorophoreMarker(fluorophore, ex??, em??)
    end
end
# }}}

end
