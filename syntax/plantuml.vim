" Vim syntax file
" Language:     PlantUML
" License:      VIM LICENSE
if exists('b:current_syntax')
  finish
endif

if v:version < 600
  syntax clear
endif

let s:cpo_orig=&cpoptions
set cpoptions&vim

let b:current_syntax = 'plantuml'

syntax sync minlines=100

syntax match plantumlPreProc /\%(^@start\|^@end\)\%(board\|bpm\|chen\|chronology\|creole\|cute\|def\|ditaa\|dot\|ebnf\|files\|flow\|gantt\|git\|hcl\|jcckit\|json\|latex\|math\|mindmap\|nwdiag\|project\|regex\|salt\|tree\|uml\|wbs\|wire\|yaml\)/
syntax match plantumlPreProc /!\?\%(function\|procedure\|endprocedure\|endfunction\|unquoted\)/
syntax match plantumlPreProc /!\%(assert\|define\|definelong\|dump_memory\|else\|enddefinelong\|endif\|endsub\|exit\|if\|ifdef\|ifndef\|import\|include\|local\|log\|pragma\|return\|startsub\|theme\|undef\)\s*.*/ contains=plantumlDir
syntax region plantumlDir start=/\s\+/ms=s+1 end=/$/ contained

" Procedure and function definitions
syntax region plantumlParameters contained matchgroup=Function keepend start="(" end=")\s*$" contains=TOP
syntax match plantumlFunction "\%(!\%(unquoted\s\+\)\?\%(procedure\|function\)\s*\)\@<=\$\?\w\+\s*(.*)" contains=plantumlParameters

" type
" From 'java - jar plantuml.jar - language' results {{{
syntax keyword plantumlTypeKeyword abstract action actor agent annotation archimate artifact boundary card cloud
syntax keyword plantumlTypeKeyword collections component control database diamond entity enum exception file folder
syntax keyword plantumlTypeKeyword frame hexagon json label map metaclass node object package participant person
syntax keyword plantumlTypeKeyword process protocol queue rectangle relationship stack state storage struct usecase
" class and interface are defined as plantumlClassKeyword
syntax keyword plantumlClassKeyword class interface
"}}}
" Not in 'java - jar plantuml.jar - language' results
syntax keyword plantumlTypeKeyword concise robust

" keyword
" From 'java - jar plantuml.jar - language' results {{{
" Since "syntax keyword" can handle only words, "top to bottom direction", "left to right direction" are excluded.
syntax keyword plantumlKeyword across activate again allow_mixing allowmixing also alt as attribute attributes
syntax keyword plantumlKeyword autonumber bold bottom box break caption center circle circled circles color
syntax keyword plantumlKeyword create critical dashed deactivate description destroy detach dotted down else
syntax keyword plantumlKeyword elseif empty end endcaption endfooter endheader endif endlegend endtitle
syntax keyword plantumlKeyword endwhile false field fields footbox footer fork group header hide hnote if is
syntax keyword plantumlKeyword italic kill left legend link loop mainframe member members method methods
syntax keyword plantumlKeyword namespace newpage normal note of on opt order over page par partition
syntax keyword plantumlKeyword plain private protected public ref repeat return right rnote rotate show skin
syntax keyword plantumlKeyword skinparam split sprite start stereotype stereotypes stop style then title
syntax keyword plantumlKeyword together top true up while

"}}}
" Not in 'java - jar plantuml.jar - language' results
syntax keyword plantumlKeyword endlegend sprite then
" gantt
syntax keyword plantumlTypeKeyword monday tuesday wednesday thursday friday saturday sunday today
syntax keyword plantumlTypeKeyword project Project labels Labels last first column
syntax keyword plantumlKeyword starts ends closed after colored lasts happens in at are to the and
syntax keyword plantumlKeyword printscale ganttscale projectscale daily weekly monthly quarterly yearly zoom
syntax keyword plantumlKeyword day days week weeks today then complete displays same row pauses

syntax keyword plantumlCommentTODO XXX TODO FIXME NOTE contained
" PlantUML colors are 6 hexa digit long plus optionaly 2 more to code transparency
syntax match plantumlColor /#\x\{6\}\%(\x\{2\}\)\?\>/
syntax case ignore
syntax keyword plantumlColor APPLICATION AliceBlue AntiqueWhite Aqua Aquamarine Azure BUSINESS Beige Bisque
syntax keyword plantumlColor Black BlanchedAlmond Blue BlueViolet Brown BurlyWood CadetBlue Chartreuse
syntax keyword plantumlColor Chocolate Coral CornflowerBlue Cornsilk Crimson Cyan DarkBlue DarkCyan
syntax keyword plantumlColor DarkGoldenRod DarkGray DarkGreen DarkGrey DarkKhaki DarkMagenta DarkOliveGreen
syntax keyword plantumlColor DarkOrchid DarkRed DarkSalmon DarkSeaGreen DarkSlateBlue DarkSlateGray
syntax keyword plantumlColor DarkSlateGrey DarkTurquoise DarkViolet Darkorange DeepPink DeepSkyBlue DimGray
syntax keyword plantumlColor DimGrey DodgerBlue FireBrick FloralWhite ForestGreen Fuchsia Gainsboro
syntax keyword plantumlColor GhostWhite Gold GoldenRod Gray Green GreenYellow Grey HoneyDew HotPink
syntax keyword plantumlColor IMPLEMENTATION IndianRed Indigo Ivory Khaki Lavender LavenderBlush LawnGreen
syntax keyword plantumlColor LemonChiffon LightBlue LightCoral LightCyan LightGoldenRodYellow LightGray
syntax keyword plantumlColor LightGreen LightGrey LightPink LightSalmon LightSeaGreen LightSkyBlue
syntax keyword plantumlColor LightSlateGray LightSlateGrey LightSteelBlue LightYellow Lime LimeGreen Linen
syntax keyword plantumlColor MOTIVATION Magenta Maroon MediumAquaMarine MediumBlue MediumOrchid MediumPurple
syntax keyword plantumlColor MediumSeaGreen MediumSlateBlue MediumSpringGreen MediumTurquoise MediumVioletRed
syntax keyword plantumlColor MidnightBlue MintCream MistyRose Moccasin NavajoWhite Navy OldLace Olive
syntax keyword plantumlColor OliveDrab Orange OrangeRed Orchid PHYSICAL PaleGoldenRod PaleGreen PaleTurquoise
syntax keyword plantumlColor PaleVioletRed PapayaWhip PeachPuff Peru Pink Plum PowderBlue Purple Red
syntax keyword plantumlColor RosyBrown RoyalBlue STRATEGY SaddleBrown Salmon SandyBrown SeaGreen SeaShell
syntax keyword plantumlColor Sienna Silver SkyBlue SlateBlue SlateGray SlateGrey Snow SpringGreen SteelBlue
syntax keyword plantumlColor TECHNOLOGY Tan Teal Thistle Tomato Turquoise Violet Wheat White WhiteSmoke
syntax keyword plantumlColor Yellow YellowGreen
syntax case match

" Arrows
syntax match plantumlArrow /.\@=\([.-]\)\1\+\ze\s*\%(\w\|(\)/

syntax match plantumlClassRelationLR /\([-.]\)\1*\%(\w\{,5\}\1\+\)\?\%(|>\|>\|*\|o\|x\|#\|{\|+\|\^\)/ contains=plantumlArrowDirectedLine
syntax match plantumlClassRelationRL /\%(<|\|<\|*\|o\|x\|#\|}\|+\|\^\)\([-.]\)\1*\%(\w\{,5\}\1\+\)\?/ contains=plantumlArrowDirectedLine

syntax match plantumlArrowLR /\[\?\([-.]\)\1*\%(\w\{,5}\1\+\)\?\%(\[[^\]]\+\]\)\?\1*\(>\|\\\|\/\)\2\?[ox]\?\]\?\%(\[[^\]]*\]\)\?/ contains=plantumlText,plantumlArrowDirectedLine
syntax match plantumlArrowRL /\[\?[ox]\?\(<\|\\\|\/\)\1\?\([-.]\)\2*\%(\w\{,5}\2\+\)\?\]\?\%(\[[^\]]*\]\)\?/ contains=plantumlText,plantumlArrowDirectedLine
syntax match plantumlArrowBoth /[ox]\?\(<\|\\\|\/\)\1\?\([-.]\)\2*\%(\w\{,5}\2\+\)\?\(>\|\\\|\/\)\3\?[ox]\?/ contains=plantumlArrowDirectedLine
syntax region plantumlText oneline start=/\[/ms=s+1 end=/\]/me=s-1 contained

syntax match plantumlArrowDirectedLine /\([-.]\)\%(l\%[eft]\|r\%[ight]\|up\?\|d\%[own]\)\1/ contained

" Note and legend
syntax region plantumlNoteMultiLine start=/\%(^\s*[rh]\?\%(note\|legend\)\)\@<=\s\%([^:"]\+$\)\@=/ end=/^\%(\s*\zeend\s*[rh]\?\%(note\|legend\)$\)\|endlegend\@=/ contains=plantumlSpecialString,plantumlNoteMultiLineStart,plantumlTag
syntax match plantumlNoteMultiLineStart /\%(^\s*[rh]\?\%(note\|legend\)\)\@<=\s\%([^:]\+$\)/ contained contains=plantumlKeyword,plantumlColor,plantumlString,plantumlTag

" Class
syntax region plantumlClass
      \ start=/\%(\%(class\|interface\|object\)\s[^{]\+\)\@<=\zs{/
      \ end=/^\s*}/
      \ contains=plantumlClassArrows,
      \          plantumlClassKeyword,
      \          @plantumlClassOp,
      \          plantumlClassSeparator,
      \          plantumlComment

syntax match plantumlClassPublic      /^\s*+\s*\w\+/ contained
syntax match plantumlClassPrivate     /^\s*-\s*\w\+/ contained
syntax match plantumlClassProtected   /^\s*#\s*\w\+/ contained
syntax match plantumlClassPackPrivate /^\s*\~\s*\w\+/ contained
syntax match plantumlClassSeparator   /__\%(.\+__\)\?\|==\%(.\+==\)\?\|--\%(.\+--\)\?\|\.\.\%(.\+\.\.\)\?/ contained

syntax cluster plantumlClassOp contains=plantumlClassPublic,
      \                                 plantumlClassPrivate,
      \                                 plantumlClassProtected,
      \                                 plantumlClassPackPrivate

" Strings
syntax match plantumlSpecialString /\\n/ contained
syntax region plantumlString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=plantumlSpecialString
syntax region plantumlString start=/'/ skip=/\\\\\|\\'/ end=/'/ oneline contains=plantumlSpecialString
syntax match plantumlComment /^\s*'.*$/ contains=plantumlCommentTODO
syntax region plantumlMultilineComment start=/\/'/ end=/'\// contains=plantumlCommentTODO

syntax match plantumlTag /<\/\?[bi]>/
syntax region plantumlTag start=/<\/\?\%(back\|color\|del\|font\|img\|s\|size\|strike\|u\|w\)/ end=/>/

" Labels with a colon
syntax match plantumlColonLine /\S\@<=\s*:\s*\zs.\+$/ contains=plantumlSpecialString

" Stereotypes
syntax match plantumlStereotype /<<[^-.]\+>>/ contains=plantumlSpecialString

" Activity diagram
syntax match plantumlActivityThing /([^)]*)/
syntax match plantumlActivitySynch /===[^=]\+===/
syntax match plantumlActivityLabel /\%(^\%(#\S\+\)\?\)\@<=:\_[^;|<>/\]}]\+[;|<>/\]}]$/ contains=plantumlSpecialString

" Sequence diagram
syntax match plantumlSequenceDivider /^\s*==[^=]\+==\s*$/
syntax match plantumlSequenceSpace /^\s*|||\+\s*$/
syntax match plantumlSequenceSpace /^\s*||\d\+||\+\s*$/
syntax match plantumlSequenceDelay /^\s*\.\{3}$/
syntax region plantumlText oneline matchgroup=plantumlSequenceDelay start=/^\s*\.\{3}/ end=/\.\{3}$/

" Usecase diagram
syntax match plantumlUsecaseActor /^\s*:.\{-1,}:/ contains=plantumlSpecialString


" Mindmap diagram
let s:mindmapHilightLinks = [
      \ 'WarningMsg', 'Directory', 'Special', 'MoreMsg', 'Statement', 'Title',
      \ 'Question', 'LineNr', 'ModeMsg', 'Title', 'MoreMsg', 'SignColumn',
      \ 'Function', 'Todo'
      \  ]

let s:i = 1
let s:contained = []
let s:mindmap_color = '\(\[#[^\]]\+\]\)\?'
let s:mindmap_removing_box = '_\?'
let s:mindmap_options = join([s:mindmap_color, s:mindmap_removing_box], '')
while s:i < len(s:mindmapHilightLinks)
  execute 'syntax match plantumlMindmap' . s:i . ' /^\([-+*]\)\1\{' . (s:i - 1) . '}' . s:mindmap_options . '\(:\|\s\+\)/ contained'
  execute 'syntax match plantumlMindmap' . s:i . ' /^\s\{' . (s:i - 1) . '}\*' . s:mindmap_options . '\(:\|\s\+\)/ contained'
  execute 'highlight default link plantumlMindmap' . s:i . ' ' . s:mindmapHilightLinks[s:i - 1]
  call add(s:contained, 'plantumlMindmap' . s:i)
  let s:i = s:i + 1
endwhile

execute 'syntax region plantumlMindmap oneline start=/^\([-+*]\)\1*' . s:mindmap_options . '\s/ end=/$/ contains=' . join(s:contained, ',')
" Multilines
execute 'syntax region plantumlMindmap start=/^\([-+*]\)\1*' . s:mindmap_options . ':/ end=/;$/ contains=' . join(s:contained, ',')
" Markdown syntax
execute 'syntax region plantumlMindmap oneline start=/^\s*\*' . s:mindmap_options . '\s/ end=/$/ contains=' . join(s:contained, ',')

" Gantt diagram
syntax match plantumlGanttTask /\[[^\]]\{-}\]\%('s\)\?/ contains=plantumlSpecialString


" Skinparam keywords
syntax case ignore
syntax keyword plantumlSkinparamKeyword ActivityBackgroundColor ActivityBorderColor ActivityBorderThickness
syntax keyword plantumlSkinparamKeyword ActivityDiamondFontColor ActivityDiamondFontName ActivityDiamondFontSize
syntax keyword plantumlSkinparamKeyword ActivityDiamondFontStyle ActivityFontColor ActivityFontName ActivityFontSize
syntax keyword plantumlSkinparamKeyword ActivityFontStyle ActorBackgroundColor ActorBorderColor ActorFontColor
syntax keyword plantumlSkinparamKeyword ActorFontName ActorFontSize ActorFontStyle ActorStereotypeFontColor
syntax keyword plantumlSkinparamKeyword ActorStereotypeFontName ActorStereotypeFontSize ActorStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword AgentBorderThickness AgentFontColor AgentFontName AgentFontSize AgentFontStyle
syntax keyword plantumlSkinparamKeyword AgentStereotypeFontColor AgentStereotypeFontName AgentStereotypeFontSize
syntax keyword plantumlSkinparamKeyword AgentStereotypeFontStyle ArchimateBorderThickness ArchimateFontColor
syntax keyword plantumlSkinparamKeyword ArchimateFontName ArchimateFontSize ArchimateFontStyle
syntax keyword plantumlSkinparamKeyword ArchimateStereotypeFontColor ArchimateStereotypeFontName
syntax keyword plantumlSkinparamKeyword ArchimateStereotypeFontSize ArchimateStereotypeFontStyle ArrowFontColor
syntax keyword plantumlSkinparamKeyword ArrowFontName ArrowFontSize ArrowFontStyle ArrowHeadColor ArrowLollipopColor
syntax keyword plantumlSkinparamKeyword ArrowMessageAlignment ArrowThickness ArtifactFontColor ArtifactFontName
syntax keyword plantumlSkinparamKeyword ArtifactFontSize ArtifactFontStyle ArtifactStereotypeFontColor
syntax keyword plantumlSkinparamKeyword ArtifactStereotypeFontName ArtifactStereotypeFontSize
syntax keyword plantumlSkinparamKeyword ArtifactStereotypeFontStyle BackgroundColor BiddableBackgroundColor
syntax keyword plantumlSkinparamKeyword BiddableBorderColor BoundaryFontColor BoundaryFontName BoundaryFontSize
syntax keyword plantumlSkinparamKeyword BoundaryFontStyle BoundaryStereotypeFontColor BoundaryStereotypeFontName
syntax keyword plantumlSkinparamKeyword BoundaryStereotypeFontSize BoundaryStereotypeFontStyle BoxPadding
syntax keyword plantumlSkinparamKeyword CaptionFontColor CaptionFontName CaptionFontSize CaptionFontStyle
syntax keyword plantumlSkinparamKeyword CardBorderThickness CardFontColor CardFontName CardFontSize CardFontStyle
syntax keyword plantumlSkinparamKeyword CardStereotypeFontColor CardStereotypeFontName CardStereotypeFontSize
syntax keyword plantumlSkinparamKeyword CardStereotypeFontStyle CircledCharacterFontColor CircledCharacterFontName
syntax keyword plantumlSkinparamKeyword CircledCharacterFontSize CircledCharacterFontStyle CircledCharacterRadius
syntax keyword plantumlSkinparamKeyword ClassAttributeFontColor ClassAttributeFontName ClassAttributeFontSize
syntax keyword plantumlSkinparamKeyword ClassAttributeFontStyle ClassAttributeIconSize ClassBackgroundColor
syntax keyword plantumlSkinparamKeyword ClassBorderColor ClassBorderThickness ClassFontColor ClassFontName ClassFontSize
syntax keyword plantumlSkinparamKeyword ClassFontStyle ClassStereotypeFontColor ClassStereotypeFontName
syntax keyword plantumlSkinparamKeyword ClassStereotypeFontSize ClassStereotypeFontStyle CloudFontColor CloudFontName
syntax keyword plantumlSkinparamKeyword CloudFontSize CloudFontStyle CloudStereotypeFontColor CloudStereotypeFontName
syntax keyword plantumlSkinparamKeyword CloudStereotypeFontSize CloudStereotypeFontStyle ColorArrowSeparationSpace
syntax keyword plantumlSkinparamKeyword ComponentBorderThickness ComponentFontColor ComponentFontName ComponentFontSize
syntax keyword plantumlSkinparamKeyword ComponentFontStyle ComponentStereotypeFontColor ComponentStereotypeFontName
syntax keyword plantumlSkinparamKeyword ComponentStereotypeFontSize ComponentStereotypeFontStyle ComponentStyle
syntax keyword plantumlSkinparamKeyword ConditionEndStyle ConditionStyle ControlFontColor ControlFontName
syntax keyword plantumlSkinparamKeyword ControlFontSize ControlFontStyle ControlStereotypeFontColor
syntax keyword plantumlSkinparamKeyword ControlStereotypeFontName ControlStereotypeFontSize ControlStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword DatabaseFontColor DatabaseFontName DatabaseFontSize DatabaseFontStyle
syntax keyword plantumlSkinparamKeyword DatabaseStereotypeFontColor DatabaseStereotypeFontName
syntax keyword plantumlSkinparamKeyword DatabaseStereotypeFontSize DatabaseStereotypeFontStyle DefaultFontColor
syntax keyword plantumlSkinparamKeyword DefaultFontName DefaultFontSize DefaultFontStyle DefaultMonospacedFontName
syntax keyword plantumlSkinparamKeyword DefaultTextAlignment DesignedBackgroundColor DesignedBorderColor
syntax keyword plantumlSkinparamKeyword DesignedDomainBorderThickness DesignedDomainFontColor DesignedDomainFontName
syntax keyword plantumlSkinparamKeyword DesignedDomainFontSize DesignedDomainFontStyle DesignedDomainStereotypeFontColor
syntax keyword plantumlSkinparamKeyword DesignedDomainStereotypeFontName DesignedDomainStereotypeFontSize
syntax keyword plantumlSkinparamKeyword DesignedDomainStereotypeFontStyle DiagramBorderColor DiagramBorderThickness
syntax keyword plantumlSkinparamKeyword DomainBackgroundColor DomainBorderColor DomainBorderThickness DomainFontColor
syntax keyword plantumlSkinparamKeyword DomainFontName DomainFontSize DomainFontStyle DomainStereotypeFontColor
syntax keyword plantumlSkinparamKeyword DomainStereotypeFontName DomainStereotypeFontSize DomainStereotypeFontStyle Dpi
syntax keyword plantumlSkinparamKeyword EntityFontColor EntityFontName EntityFontSize EntityFontStyle
syntax keyword plantumlSkinparamKeyword EntityStereotypeFontColor EntityStereotypeFontName EntityStereotypeFontSize
syntax keyword plantumlSkinparamKeyword EntityStereotypeFontStyle FileFontColor FileFontName FileFontSize FileFontStyle
syntax keyword plantumlSkinparamKeyword FileStereotypeFontColor FileStereotypeFontName FileStereotypeFontSize
syntax keyword plantumlSkinparamKeyword FileStereotypeFontStyle FixCircleLabelOverlapping FolderFontColor FolderFontName
syntax keyword plantumlSkinparamKeyword FolderFontSize FolderFontStyle FolderStereotypeFontColor
syntax keyword plantumlSkinparamKeyword FolderStereotypeFontName FolderStereotypeFontSize FolderStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword FooterFontColor FooterFontName FooterFontSize FooterFontStyle FrameFontColor
syntax keyword plantumlSkinparamKeyword FrameFontName FrameFontSize FrameFontStyle FrameStereotypeFontColor
syntax keyword plantumlSkinparamKeyword FrameStereotypeFontName FrameStereotypeFontSize FrameStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword GenericDisplay Guillemet Handwritten HeaderFontColor HeaderFontName
syntax keyword plantumlSkinparamKeyword HeaderFontSize HeaderFontStyle HexagonBorderThickness HexagonFontColor
syntax keyword plantumlSkinparamKeyword HexagonFontName HexagonFontSize HexagonFontStyle HexagonStereotypeFontColor
syntax keyword plantumlSkinparamKeyword HexagonStereotypeFontName HexagonStereotypeFontSize HexagonStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword HyperlinkColor HyperlinkUnderline IconIEMandatoryColor
syntax keyword plantumlSkinparamKeyword IconPackageBackgroundColor IconPackageColor IconPrivateBackgroundColor
syntax keyword plantumlSkinparamKeyword IconPrivateColor IconProtectedBackgroundColor IconProtectedColor
syntax keyword plantumlSkinparamKeyword IconPublicBackgroundColor IconPublicColor InterfaceFontColor InterfaceFontName
syntax keyword plantumlSkinparamKeyword InterfaceFontSize InterfaceFontStyle InterfaceStereotypeFontColor
syntax keyword plantumlSkinparamKeyword InterfaceStereotypeFontName InterfaceStereotypeFontSize
syntax keyword plantumlSkinparamKeyword InterfaceStereotypeFontStyle LabelFontColor LabelFontName LabelFontSize
syntax keyword plantumlSkinparamKeyword LabelFontStyle LabelStereotypeFontColor LabelStereotypeFontName
syntax keyword plantumlSkinparamKeyword LabelStereotypeFontSize LabelStereotypeFontStyle LegendBorderThickness
syntax keyword plantumlSkinparamKeyword LegendFontColor LegendFontName LegendFontSize LegendFontStyle
syntax keyword plantumlSkinparamKeyword LexicalBackgroundColor LexicalBorderColor LifelineStrategy Linetype
syntax keyword plantumlSkinparamKeyword MachineBackgroundColor MachineBorderColor MachineBorderThickness
syntax keyword plantumlSkinparamKeyword MachineFontColor MachineFontName MachineFontSize MachineFontStyle
syntax keyword plantumlSkinparamKeyword MachineStereotypeFontColor MachineStereotypeFontName MachineStereotypeFontSize
syntax keyword plantumlSkinparamKeyword MachineStereotypeFontStyle MaxAsciiMessageLength MaxMessageSize MinClassWidth
syntax keyword plantumlSkinparamKeyword Monochrome NodeFontColor NodeFontName NodeFontSize NodeFontStyle
syntax keyword plantumlSkinparamKeyword NodeStereotypeFontColor NodeStereotypeFontName NodeStereotypeFontSize
syntax keyword plantumlSkinparamKeyword NodeStereotypeFontStyle Nodesep NoteBackgroundColor NoteBorderColor
syntax keyword plantumlSkinparamKeyword NoteBorderThickness NoteFontColor NoteFontName NoteFontSize NoteFontStyle
syntax keyword plantumlSkinparamKeyword NoteShadowing NoteTextAlignment ObjectAttributeFontColor ObjectAttributeFontName
syntax keyword plantumlSkinparamKeyword ObjectAttributeFontSize ObjectAttributeFontStyle ObjectBorderThickness
syntax keyword plantumlSkinparamKeyword ObjectFontColor ObjectFontName ObjectFontSize ObjectFontStyle
syntax keyword plantumlSkinparamKeyword ObjectStereotypeFontColor ObjectStereotypeFontName ObjectStereotypeFontSize
syntax keyword plantumlSkinparamKeyword ObjectStereotypeFontStyle PackageBorderThickness PackageFontColor
syntax keyword plantumlSkinparamKeyword PackageFontName PackageFontSize PackageFontStyle PackageStereotypeFontColor
syntax keyword plantumlSkinparamKeyword PackageStereotypeFontName PackageStereotypeFontSize PackageStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword PackageStyle PackageTitleAlignment Padding PageBorderColor PageExternalColor
syntax keyword plantumlSkinparamKeyword PageMargin ParticipantFontColor ParticipantFontName ParticipantFontSize
syntax keyword plantumlSkinparamKeyword ParticipantFontStyle ParticipantPadding ParticipantStereotypeFontColor
syntax keyword plantumlSkinparamKeyword ParticipantStereotypeFontName ParticipantStereotypeFontSize
syntax keyword plantumlSkinparamKeyword ParticipantStereotypeFontStyle PartitionBorderThickness PartitionFontColor
syntax keyword plantumlSkinparamKeyword PartitionFontName PartitionFontSize PartitionFontStyle PathHoverColor
syntax keyword plantumlSkinparamKeyword PersonBorderThickness PersonFontColor PersonFontName PersonFontSize
syntax keyword plantumlSkinparamKeyword PersonFontStyle PersonStereotypeFontColor PersonStereotypeFontName
syntax keyword plantumlSkinparamKeyword PersonStereotypeFontSize PersonStereotypeFontStyle QueueBorderThickness
syntax keyword plantumlSkinparamKeyword QueueFontColor QueueFontName QueueFontSize QueueFontStyle
syntax keyword plantumlSkinparamKeyword QueueStereotypeFontColor QueueStereotypeFontName QueueStereotypeFontSize
syntax keyword plantumlSkinparamKeyword QueueStereotypeFontStyle Ranksep RectangleBorderThickness RectangleFontColor
syntax keyword plantumlSkinparamKeyword RectangleFontName RectangleFontSize RectangleFontStyle
syntax keyword plantumlSkinparamKeyword RectangleStereotypeFontColor RectangleStereotypeFontName
syntax keyword plantumlSkinparamKeyword RectangleStereotypeFontSize RectangleStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword RequirementBackgroundColor RequirementBorderColor RequirementBorderThickness
syntax keyword plantumlSkinparamKeyword RequirementFontColor RequirementFontName RequirementFontSize
syntax keyword plantumlSkinparamKeyword RequirementFontStyle RequirementStereotypeFontColor
syntax keyword plantumlSkinparamKeyword RequirementStereotypeFontName RequirementStereotypeFontSize
syntax keyword plantumlSkinparamKeyword RequirementStereotypeFontStyle ResponseMessageBelowArrow RoundCorner
syntax keyword plantumlSkinparamKeyword SameClassWidth SequenceActorBorderThickness SequenceArrowThickness
syntax keyword plantumlSkinparamKeyword SequenceBoxBorderColor SequenceBoxFontColor SequenceBoxFontName
syntax keyword plantumlSkinparamKeyword SequenceBoxFontSize SequenceBoxFontStyle SequenceDelayFontColor
syntax keyword plantumlSkinparamKeyword SequenceDelayFontName SequenceDelayFontSize SequenceDelayFontStyle
syntax keyword plantumlSkinparamKeyword SequenceDividerBorderThickness SequenceDividerFontColor SequenceDividerFontName
syntax keyword plantumlSkinparamKeyword SequenceDividerFontSize SequenceDividerFontStyle
syntax keyword plantumlSkinparamKeyword SequenceGroupBodyBackgroundColor SequenceGroupBorderThickness
syntax keyword plantumlSkinparamKeyword SequenceGroupFontColor SequenceGroupFontName SequenceGroupFontSize
syntax keyword plantumlSkinparamKeyword SequenceGroupFontStyle SequenceGroupHeaderFontColor SequenceGroupHeaderFontName
syntax keyword plantumlSkinparamKeyword SequenceGroupHeaderFontSize SequenceGroupHeaderFontStyle
syntax keyword plantumlSkinparamKeyword SequenceLifeLineBorderColor SequenceLifeLineBorderThickness
syntax keyword plantumlSkinparamKeyword SequenceMessageAlignment SequenceMessageTextAlignment
syntax keyword plantumlSkinparamKeyword SequenceNewpageSeparatorColor SequenceParticipant
syntax keyword plantumlSkinparamKeyword SequenceParticipantBorderThickness SequenceReferenceAlignment
syntax keyword plantumlSkinparamKeyword SequenceReferenceBackgroundColor SequenceReferenceBorderThickness
syntax keyword plantumlSkinparamKeyword SequenceReferenceFontColor SequenceReferenceFontName SequenceReferenceFontSize
syntax keyword plantumlSkinparamKeyword SequenceReferenceFontStyle SequenceReferenceHeaderBackgroundColor
syntax keyword plantumlSkinparamKeyword SequenceStereotypeFontColor SequenceStereotypeFontName
syntax keyword plantumlSkinparamKeyword SequenceStereotypeFontSize SequenceStereotypeFontStyle Shadowing StackFontColor
syntax keyword plantumlSkinparamKeyword StackFontName StackFontSize StackFontStyle StackStereotypeFontColor
syntax keyword plantumlSkinparamKeyword StackStereotypeFontName StackStereotypeFontSize StackStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword StateAttributeFontColor StateAttributeFontName StateAttributeFontSize
syntax keyword plantumlSkinparamKeyword StateAttributeFontStyle StateBorderColor StateFontColor StateFontName
syntax keyword plantumlSkinparamKeyword StateFontSize StateFontStyle StateMessageAlignment StereotypePosition
syntax keyword plantumlSkinparamKeyword StorageFontColor StorageFontName StorageFontSize StorageFontStyle
syntax keyword plantumlSkinparamKeyword StorageStereotypeFontColor StorageStereotypeFontName StorageStereotypeFontSize
syntax keyword plantumlSkinparamKeyword StorageStereotypeFontStyle Style SvglinkTarget SwimlaneBorderThickness
syntax keyword plantumlSkinparamKeyword SwimlaneTitleFontColor SwimlaneTitleFontName SwimlaneTitleFontSize
syntax keyword plantumlSkinparamKeyword SwimlaneTitleFontStyle SwimlaneWidth SwimlaneWrapTitleWidth TabSize
syntax keyword plantumlSkinparamKeyword TimingFontColor TimingFontName TimingFontSize TimingFontStyle
syntax keyword plantumlSkinparamKeyword TitleBorderRoundCorner TitleBorderThickness TitleFontColor TitleFontName
syntax keyword plantumlSkinparamKeyword TitleFontSize TitleFontStyle UsecaseBorderThickness UsecaseFontColor
syntax keyword plantumlSkinparamKeyword UsecaseFontName UsecaseFontSize UsecaseFontStyle UsecaseStereotypeFontColor
syntax keyword plantumlSkinparamKeyword UsecaseStereotypeFontName UsecaseStereotypeFontSize UsecaseStereotypeFontStyle
syntax keyword plantumlSkinparamKeyword WrapWidth

" Not in 'java - jar plantuml.jar - language' output
syntax keyword plantumlSkinparamKeyword activityArrowColor activityArrowFontColor activityArrowFontName
syntax keyword plantumlSkinparamKeyword activityArrowFontSize activityArrowFontStyle BarColor BorderColor
syntax keyword plantumlSkinparamKeyword CharacterFontColor CharacterFontName CharacterFontSize CharacterFontStyle
syntax keyword plantumlSkinparamKeyword CharacterRadius classArrowColor classArrowFontColor classArrowFontName
syntax keyword plantumlSkinparamKeyword classArrowFontSize classArrowFontStyle Color componentArrowColor
syntax keyword plantumlSkinparamKeyword componentArrowFontColor componentArrowFontName componentArrowFontSize
syntax keyword plantumlSkinparamKeyword componentArrowFontStyle componentInterfaceBackgroundColor
syntax keyword plantumlSkinparamKeyword componentInterfaceBorderColor DividerBackgroundColor DividerFontColor
syntax keyword plantumlSkinparamKeyword DividerFontName DividerFontSize DividerFontStyle EndColor FontColor FontName
syntax keyword plantumlSkinparamKeyword FontSize FontStyle GroupBackgroundColor GroupingFontColor GroupingFontName
syntax keyword plantumlSkinparamKeyword GroupingFontSize GroupingFontStyle GroupingHeaderFontColor
syntax keyword plantumlSkinparamKeyword GroupingHeaderFontName GroupingHeaderFontSize GroupingHeaderFontStyle
syntax keyword plantumlSkinparamKeyword LifeLineBackgroundColor LifeLineBorderColor
syntax keyword plantumlSkinparamKeyword LineColor LineStyle LineThickness
syntax keyword plantumlSkinparamKeyword sequenceActorBackgroundColor sequenceActorBorderColor sequenceActorFontColor
syntax keyword plantumlSkinparamKeyword sequenceActorFontName sequenceActorFontSize sequenceActorFontStyle
syntax keyword plantumlSkinparamKeyword sequenceArrowColor sequenceArrowFontColor sequenceArrowFontName
syntax keyword plantumlSkinparamKeyword sequenceArrowFontSize sequenceArrowFontStyle sequenceGroupingFontColor
syntax keyword plantumlSkinparamKeyword sequenceGroupingFontName sequenceGroupingFontSize sequenceGroupingFontStyle
syntax keyword plantumlSkinparamKeyword sequenceGroupingHeaderFontColor sequenceGroupingHeaderFontName
syntax keyword plantumlSkinparamKeyword sequenceGroupingHeaderFontSize sequenceGroupingHeaderFontStyle
syntax keyword plantumlSkinparamKeyword sequenceParticipantBackgroundColor sequenceParticipantBorderColor
syntax keyword plantumlSkinparamKeyword sequenceParticipantFontColor sequenceParticipantFontName
syntax keyword plantumlSkinparamKeyword sequenceParticipantFontSize sequenceParticipantFontStyle StartColor
syntax keyword plantumlSkinparamKeyword stateArrowColor stateArrowFontColor stateArrowFontName stateArrowFontSize
syntax keyword plantumlSkinparamKeyword stateArrowFontStyle StereotypeFontColor StereotypeFontName StereotypeFontSize
syntax keyword plantumlSkinparamKeyword StereotypeFontStyle usecaseActorBackgroundColor usecaseActorBorderColor
syntax keyword plantumlSkinparamKeyword usecaseActorFontColor usecaseActorFontName usecaseActorFontSize
syntax keyword plantumlSkinparamKeyword usecaseActorFontStyle usecaseActorStereotypeFontColor
syntax keyword plantumlSkinparamKeyword usecaseActorStereotypeFontName usecaseActorStereotypeFontSize
syntax keyword plantumlSkinparamKeyword usecaseActorStereotypeFontStyle usecaseArrowColor usecaseArrowFontColor
syntax keyword plantumlSkinparamKeyword usecaseArrowFontName usecaseArrowFontSize usecaseArrowFontStyle
syntax case match

" Other style keywords not found in plantumlSkinparamKeyword
" Some are not implemented (yet)
" see https://plantuml.com/fr/style-evolution
" TODO: put those keywords in a new "<style>" region
syntax case ignore
syntax keyword plantumlSkinparamKeyword Margin HorizontalAlignment DiagonalCorner ExportedName Image ImagePosition MinimumWidth WordWrap MaximumWidth
syntax case match

" Builtin Function
" https://plantuml.com/ja/preprocessing
syntax match plantumlBuiltinFunction /%\%(chr\|darken\|date\|dec2hex\|dirpath\|feature\|false\|file_exists\|filename\|function_exists\|get_variable_value\|getenv\|hex2dec\|hsl_color\|intval\|is_dark\|is_light\|lighten\|loadJSON\|lower\|newline\|not\|lighten\|reverse_color\|reverse_hsluv_color\|set_variable_value\|size\|string\|strlen\|strpos\|substr\|true\|upper\|variable_exists\|version\)/

" Highlight
highlight default link plantumlCommentTODO Todo
highlight default link plantumlKeyword Keyword
highlight default link plantumlClassKeyword Keyword
highlight default link plantumlTypeKeyword Type
highlight default link plantumlPreProc PreProc
highlight default link plantumlDir Constant
highlight default link plantumlColor Constant
highlight default link plantumlArrow Identifier
highlight default link plantumlArrowBoth Identifier
highlight default link plantumlArrowLR Identifier
highlight default link plantumlArrowRL Identifier
highlight default link plantumlArrowDirectedLine Identifier
highlight default link plantumlClassRelationLR Identifier
highlight default link plantumlClassRelationRL Identifier
highlight default link plantumlText Label
highlight default link plantumlClass Type
highlight default link plantumlClassPublic Structure
highlight default link plantumlClassPrivate Macro
highlight default link plantumlClassProtected Statement
highlight default link plantumlClassPackPrivate Function
highlight default link plantumlClassSeparator Comment
highlight default link plantumlSequenceDivider Comment
highlight default link plantumlSequenceSpace Comment
highlight default link plantumlTag Identifier
highlight default link plantumlSequenceDelay Identifier
highlight default link plantumlSpecialString Special
highlight default link plantumlString String
highlight default link plantumlComment Comment
highlight default link plantumlMultilineComment Comment
highlight default link plantumlColonLine Comment
highlight default link plantumlActivityThing Type
highlight default link plantumlActivitySynch Type
highlight default link plantumlActivityLabel String
highlight default link plantumlSkinparamKeyword Identifier
highlight default link plantumlNoteMultiLine String
highlight default link plantumlUsecaseActor String
highlight default link plantumlStereotype Type
highlight default link plantumlBuiltinFunction Function
highlight default link plantumlFunction Function
highlight default link plantumlGanttTask Type

let &cpoptions=s:cpo_orig
unlet s:cpo_orig
