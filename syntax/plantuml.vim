" Vim syntax file
" Language:     PlantUML
" Maintainer:   Anders Thøgersen <first name at bladre dot dk>
" Last Change:  03-Apr-2011
" Version:      0.2
" TODO:         There are some bugs, add << >>
"
if exists("b:current_syntax")
    finish
endif

if version < 600
  syntax clear
endif

let b:current_syntax = "plantuml"

syntax sync minlines=100

setlocal iskeyword+=@
setlocal iskeyword+=#

syntax match plantumlPreProc /\%(^@startuml\|^@enduml\)\|!\%(include\|ifdef\|define\|endif\)\s*.*/ contains=plantumlDir
syntax region plantumlDir start=/\s\+/ms=s+1 end=/$/ contained

syntax keyword plantumlTypeKeyword namespace component package interface class interface enum object participant activity skinparam abstract
syntax keyword plantumlKeyword actor boundary control entity database partition title activate as deactivate note left right top bottom of end
syntax keyword plantumlKeyword if then else endif

syntax keyword plantumlCommentTODO XXX TODO FIXME NOTE contained
syntax match plantumlColor /#[0-9A-Fa-f]\{6\}\>/

" Arrows - Differentiate between horizontal and vertical arrows
syntax match plantumlHorizontalArrow /\%([-\.]\%(|>\|>\|\*\|o\>\|\\\\\|\\\|\/\/\|\/\|\.\|-\)\|\%(<|\|<\|\*\|\<o\|\\\\\|\\\|\/\/\|\/\)[\.-]\)\%(\[[^\]]*\]\)\?/ contains=plantumlLabel
syntax match plantumlDirectedOrVerticalArrowLR /[-\.]\%(le\?f\?t\?\|ri\?g\?h\?t\?\|up\?\|\do\?w\?n\?\)\?[-\.]\%(|>\|>>\|>\|\*\|o\>\|\\\\\|\\\|\/\/\|\/\|\.\|-\)\%(\[[^\]]*\]\)\?/ contains=plantumlLabel
syntax match plantumlDirectedOrVerticalArrowRL /\%(<|\|<<\|<\|\*\|\<o\|\\\\\|\\\|\/\/\|\/\)[-\.]\%(le\?f\?t\?\|ri\?g\?h\?t\?\|up\?\|\do\?w\?n\?\)\?[-\.]\%(\[[^\]]*\]\)\?/ contains=plantumlLabel
syntax region plantumlLabel start=/\[/ms=s+1 end=/\]/me=s-1 contained contains=plantumlText
syntax match plantumlText /\%(\w\|\s\|[\.,;_-]\)\+/ contained

" Class
syntax region plantumlClass start=/{/ end=/\s*}/ contains=plantumlClassArrows,
\                                                         plantumlKeyword,
\                                                         @plantumlClassOp

syntax match plantumlClassPublic      /+\w\+/ contained
syntax match plantumlClassPrivate     /-\w\+/ contained
syntax match plantumlClassProtected   /#\w\+/ contained
syntax match plantumlClassPackPrivate /\~\w\+/ contained

syntax cluster plantumlClassOp contains=plantumlClassPublic,
\                                       plantumlClassPrivate,
\                                       plantumlClassProtected,
\                                       plantumlClassProtected,
\                                       plantumlClassPackPrivate

" Strings
syntax match plantumlSpecialString /\\n/ contained
syntax region plantumlString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=plantumlSpecialString
syntax region plantumlString start=/'/ skip=/\\\\\|\\'/ end=/'/ contains=plantumlSpecialString
syntax match plantumlComment /'[^']*$/ contains=plantumlCommentTODO
syntax region plantumlMultilineComment start=/\/'/ end=/'\// contains=plantumlCommentTODO

" Labels with a colon
syntax match plantumlColonLine /:[^:]\+$/ contains=plantumlText

" Activity diagram
syntax match plantumlActivityThing /([^)]*)/
syntax match plantumlActivitySynch /===[^=]\+===/

" Skinparam keywords
syntax keyword plantumlSkinparamKeyword activityArrowColor activityArrowFontColor activityArrowFontName
syntax keyword plantumlSkinparamKeyword activityArrowFontSize activityArrowFontStyle activityBackgroundColor
syntax keyword plantumlSkinparamKeyword activityBarColor activityBorderColor activityEndColor activityFontColor
syntax keyword plantumlSkinparamKeyword activityFontName activityFontSize activityFontStyle activityStartColor
syntax keyword plantumlSkinparamKeyword backgroundColor circledCharacterFontColor circledCharacterFontName
syntax keyword plantumlSkinparamKeyword circledCharacterFontSize circledCharacterFontStyle circledCharacterRadius
syntax keyword plantumlSkinparamKeyword classArrowColor classArrowFontColor classArrowFontName classArrowFontSize
syntax keyword plantumlSkinparamKeyword classArrowFontStyle classAttributeFontColor classAttributeFontName
syntax keyword plantumlSkinparamKeyword classAttributeFontSize classAttributeFontStyle classAttributeIconSize
syntax keyword plantumlSkinparamKeyword classBackgroundColor classBorderColor classFontColor classFontName
syntax keyword plantumlSkinparamKeyword classFontSize classFontStyle classStereotypeFontColor classStereotypeFontName
syntax keyword plantumlSkinparamKeyword classStereotypeFontSize classStereotypeFontStyle componentArrowColor
syntax keyword plantumlSkinparamKeyword componentArrowFontColor componentArrowFontName componentArrowFontSize
syntax keyword plantumlSkinparamKeyword componentArrowFontStyle componentBackgroundColor componentBorderColor
syntax keyword plantumlSkinparamKeyword componentFontColor componentFontName componentFontSize componentFontStyle
syntax keyword plantumlSkinparamKeyword componentInterfaceBackgroundColor componentInterfaceBorderColor
syntax keyword plantumlSkinparamKeyword componentStereotypeFontColor componentStereotypeFontName
syntax keyword plantumlSkinparamKeyword componentStereotypeFontSize componentStereotypeFontStyle footerFontColor
syntax keyword plantumlSkinparamKeyword footerFontName footerFontSize footerFontStyle headerFontColor headerFontName
syntax keyword plantumlSkinparamKeyword headerFontSize headerFontStyle noteBackgroundColor noteBorderColor
syntax keyword plantumlSkinparamKeyword noteFontColor noteFontName noteFontSize noteFontStyle packageBackgroundColor
syntax keyword plantumlSkinparamKeyword packageBorderColor packageFontColor packageFontName packageFontSize
syntax keyword plantumlSkinparamKeyword packageFontStyle sequenceActorBackgroundColor sequenceActorBorderColor
syntax keyword plantumlSkinparamKeyword sequenceActorFontColor sequenceActorFontName sequenceActorFontSize
syntax keyword plantumlSkinparamKeyword sequenceActorFontStyle sequenceArrowColor sequenceArrowFontColor
syntax keyword plantumlSkinparamKeyword sequenceArrowFontName sequenceArrowFontSize sequenceArrowFontStyle
syntax keyword plantumlSkinparamKeyword sequenceDividerBackgroundColor sequenceDividerFontColor sequenceDividerFontName
syntax keyword plantumlSkinparamKeyword sequenceDividerFontSize sequenceDividerFontStyle sequenceGroupBackgroundColor
syntax keyword plantumlSkinparamKeyword sequenceGroupingFontColor sequenceGroupingFontName sequenceGroupingFontSize
syntax keyword plantumlSkinparamKeyword sequenceGroupingFontStyle sequenceGroupingHeaderFontColor
syntax keyword plantumlSkinparamKeyword sequenceGroupingHeaderFontName sequenceGroupingHeaderFontSize
syntax keyword plantumlSkinparamKeyword sequenceGroupingHeaderFontStyle sequenceLifeLineBackgroundColor
syntax keyword plantumlSkinparamKeyword sequenceLifeLineBorderColor sequenceParticipantBackgroundColor
syntax keyword plantumlSkinparamKeyword sequenceParticipantBorderColor sequenceParticipantFontColor
syntax keyword plantumlSkinparamKeyword sequenceParticipantFontName sequenceParticipantFontSize
syntax keyword plantumlSkinparamKeyword sequenceParticipantFontStyle sequenceTitleFontColor sequenceTitleFontName
syntax keyword plantumlSkinparamKeyword sequenceTitleFontSize sequenceTitleFontStyle stateArrowColor
syntax keyword plantumlSkinparamKeyword stateArrowFontColor stateArrowFontName stateArrowFontSize stateArrowFontStyle
syntax keyword plantumlSkinparamKeyword stateAttributeFontColor stateAttributeFontName stateAttributeFontSize
syntax keyword plantumlSkinparamKeyword stateAttributeFontStyle stateBackgroundColor stateBorderColor stateEndColor
syntax keyword plantumlSkinparamKeyword stateFontColor stateFontName stateFontSize stateFontStyle stateStartColor
syntax keyword plantumlSkinparamKeyword stereotypeABackgroundColor stereotypeCBackgroundColor
syntax keyword plantumlSkinparamKeyword stereotypeEBackgroundColor stereotypeIBackgroundColor titleFontColor
syntax keyword plantumlSkinparamKeyword titleFontName titleFontSize titleFontStyle usecaseActorBackgroundColor
syntax keyword plantumlSkinparamKeyword usecaseActorBorderColor usecaseActorFontColor usecaseActorFontName
syntax keyword plantumlSkinparamKeyword usecaseActorFontSize usecaseActorFontStyle usecaseActorStereotypeFontColor
syntax keyword plantumlSkinparamKeyword usecaseActorStereotypeFontName usecaseActorStereotypeFontSize
syntax keyword plantumlSkinparamKeyword usecaseActorStereotypeFontStyle usecaseArrowColor usecaseArrowFontColor
syntax keyword plantumlSkinparamKeyword usecaseArrowFontName usecaseArrowFontSize usecaseArrowFontStyle
syntax keyword plantumlSkinparamKeyword usecaseBackgroundColor usecaseBorderColor usecaseFontColor usecaseFontName
syntax keyword plantumlSkinparamKeyword usecaseFontSize usecaseFontStyle usecaseStereotypeFontColor
syntax keyword plantumlSkinparamKeyword usecaseStereotypeFontName usecaseStereotypeFontSize usecaseStereotypeFontStyle

syntax keyword plantumlSkinparamKeyword ActorBackgroundColor ActorBorderColor ActorFontColor ActorFontName
syntax keyword plantumlSkinparamKeyword ActorFontSize ActorFontStyle ActorStereotypeFontColor ActorStereotypeFontName
syntax keyword plantumlSkinparamKeyword ActorStereotypeFontSize ActorStereotypeFontStyle ArrowColor ArrowFontColor
syntax keyword plantumlSkinparamKeyword ArrowFontName ArrowFontSize ArrowFontStyle AttributeFontColor AttributeFontName
syntax keyword plantumlSkinparamKeyword AttributeFontSize AttributeFontStyle AttributeIconSize BackgroundColor BarColor
syntax keyword plantumlSkinparamKeyword BorderColor CharacterFontColor CharacterFontName CharacterFontSize
syntax keyword plantumlSkinparamKeyword CharacterFontStyle CharacterRadius Color DividerBackgroundColor
syntax keyword plantumlSkinparamKeyword DividerFontColor DividerFontName DividerFontSize DividerFontStyle EndColor
syntax keyword plantumlSkinparamKeyword FontColor FontName FontSize FontStyle GroupBackgroundColor GroupingFontColor
syntax keyword plantumlSkinparamKeyword GroupingFontName GroupingFontSize GroupingFontStyle GroupingHeaderFontColor
syntax keyword plantumlSkinparamKeyword GroupingHeaderFontName GroupingHeaderFontSize GroupingHeaderFontStyle
syntax keyword plantumlSkinparamKeyword InterfaceBackgroundColor InterfaceBorderColor LifeLineBackgroundColor
syntax keyword plantumlSkinparamKeyword LifeLineBorderColor ParticipantBackgroundColor ParticipantBorderColor
syntax keyword plantumlSkinparamKeyword ParticipantFontColor ParticipantFontName ParticipantFontSize
syntax keyword plantumlSkinparamKeyword ParticipantFontStyle StartColor stateArrowColor stereotypeABackgroundColor
syntax keyword plantumlSkinparamKeyword stereotypeCBackgroundColor stereotypeEBackgroundColor StereotypeFontColor
syntax keyword plantumlSkinparamKeyword StereotypeFontName StereotypeFontSize StereotypeFontStyle
syntax keyword plantumlSkinparamKeyword stereotypeIBackgroundColor TitleFontColor TitleFontName TitleFontSize TitleFontStyle

" Highlight
highlight default link plantumlCommentTODO Todo
highlight default link plantumlKeyword Keyword
highlight default link plantumlTypeKeyword Type
highlight default link plantumlPreProc PreProc
highlight default link plantumlDir Constant
highlight default link plantumlColor Constant
highlight default link plantumlHorizontalArrow Identifier
highlight default link plantumlDirectedOrVerticalArrowLR Special
highlight default link plantumlDirectedOrVerticalArrowRL Special
highlight default link plantumlLabel Special
highlight default link plantumlText Label
highlight default link plantumlClassPublic Structure
highlight default link plantumlClassPrivate Macro
highlight default link plantumlClassProtected Statement
highlight default link plantumlClassPackPrivate Function
highlight default link plantumlSpecialString Special
highlight default link plantumlString String
highlight default link plantumlComment Comment
highlight default link plantumlMultilineComment Comment
highlight default link plantumlColonLine Comment
highlight default link plantumlActivityThing Type
highlight default link plantumlActivitySynch Type
highlight default link plantumlSkinparamKeyword Identifier
