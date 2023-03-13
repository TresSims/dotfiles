
#include "TokyoNight_NodeGraphCommon.inc"

// -----------------------------------------------------------------

#define TokyoNightBASE		#1a1b26			// Main BG Color
#define TokyoNightBASEALT		#24283b			// Slightly lighter BG
#define TokyoNightBASEALTD	#101017			// Slightly Darker BG
#define TokyoNightBASETINT	#34548a			// BG Tint Color

#define TokyoNightBOR01 		#1b1c27			// Subtle Border

#define TokyoNightW87			#a9b1d6			// White / Active Text
#define TokyoNightW60			#cfc9c2			// Unselected / Selectable Text
#define TokyoNightW38			#565f89			// Disabled Text

#define TokyoNightACCENT		#7aa2f7			// Main Accent
#define TokyoNightERROR		#f7768e			// Error Color
#define TokyoNightWARN 		#ff9e64			// Warning Color

#define TokyoNightBTN 		#414868			// Button Color

#define DUNNO			#00FF0A			// DON'T KNOW

// -----------------------------------------------------------------



///////////////////////////////////////////



PaletteBackground:		TokyoNightBASETINT
PaletteSelected:		TokyoNightW87
ShapePaletteShape:		TokyoNightW60

BackgroundImageLocate:		TokyoNightW87
BackgroundImageBorder:		TokyoNightW87
BackgroundImageBrightness:	TokyoNightW87
BackgroundImageLink:		TokyoNightW60


GraphOverlayLeftText:		TokyoNightW60	// Indie Edition Type etc
GraphOverlayCenterText:		TokyoNightW60	// Indie Edition Type etc
GraphOverlayRightText:		TokyoNightW60 	// Indie Edition Type etc

GraphBackground:			TokyoNightBASE
GraphOverviewBackground:	TokyoNightBASETINT
GraphOverviewViewRegion:	TokyoNightBOR01
GraphOverviewBorder:		TokyoNightBOR01

GraphPromptText:			TokyoNightW60
GraphGridLines:				TokyoNightW60
GraphGridPoints:			TokyoNightW60

GraphNameText:					TokyoNightW87		// Node Type Color
GraphNodeTypeText:				TokyoNightW60		// Node Type Label
GraphCommentText:				TokyoNightW60
GraphDescriptiveNameText:		TokyoNightACCENT
GraphContextOptionDepsText:		DUNNO
GraphLopLastModifiedPrimText:	DUNNO
GraphLopLayerCountText:			DUNNO
GraphOutputForViewText:			DUNNO
GraphDetailIdText:				DUNNO
GraphNetworkBoxText:			TokyoNightW87
GraphNetworkBoxTextDark:		TokyoNightBASE
GraphNetworkBoxNameText:		DUNNO
GraphIndirectText:				TokyoNightW87
GraphIndirectTextDark:			TokyoNightBASE

GraphItemBorder:		TokyoNightBOR01
GraphMinimizeButton:	TokyoNightW60



GraphTemplateFlag:				#DD7DD7
GraphSelectableTemplateFlag:	#B151BB
GraphBypassFlag:				#E5C553
GraphRenderFlag:				#A779FF
GraphDisplayFlag:				#308DFF
GraphOutputFlag:				0.75 0.4 0.0
GraphSelectableFlag:			#ABEA21
GraphExportFlag:				#FFA600
GraphHiddenFlag:				#90BECD
GraphAudioFlag:					0.0 0.5 0.5
GraphThumbnailFlag:				0.35 0.6 0.2
GraphLockFlag:					#DA5757
GraphSoftLockFlag:				#C4 E3 61
GraphDebugFlag:					#6CC6B2
GraphMaterialFlag:				0.75 0.4 0.0
GraphDisplayAndRenderFlag:		0.00 0.68 0.94
GraphDisplayAndOutputFlag:		0.75 0.45 0.36
GraphFilterFlag:				#55FFC1

GraphDisplayHighlight:			#44679A
GraphExportHighlight:			#734670
GraphRenderHighlight:			#9273CB
GraphOutputHighlight:			#6B5634
GraphTemplateHighlight:			#734670
GraphFilterHighlight:			#298966

GraphDopObjectData:		TokyoNightW87
GraphDopData:			0.50	0.80	0.50
GraphDopRelData:		0.20	0.60	0.20
GraphDopSolverData:		0.7	0.5	0.9
GraphDopAnyData:		0.9	0.9	0.9
GraphSopHeightfield:		#25aa8e
GraphSopConstraints:		#D879D8

GraphConnector:			GREY(0.70)
GraphConnectorLabel:		GREY(0.70)
GraphConnectorError:		#CE5E5E
GraphCopMaskInput:		0.50 0.80 0.50
GraphWire:			#5F 91 CC
GraphWireUnused:		0.4 0.4 0.4
GraphWireError:			RED
GraphWireLoopBack:		0.3 0.3 1.0
GraphWireSelection:		YELLOW
GraphWireNodeSelection:		YELLOW
GraphWireLongFaded:		0.5 0.5 0.5
GraphWireLongerFaded:		0.5 0.5 0.5
GraphWireStub:			GREY(0.70)
GraphWireStubSelection:		YELLOW
GraphWireCut:			RED
GraphWireCutPath:		0.95 0.3 0.0
GraphSpareWire:			#5F 31 CC

GraphDependency:		#9A6955
GraphDependencyEndAffector:	#668E4A
GraphDependencyExternalIn:	GREY(0.8)
GraphDependencyExternalOut:	GREY(0.8)

GraphPickFill:			0.9 0.9 0.9
GraphPreSelection:		0.75 0.86 1.0
GraphItemCurrent:		#FFD400
GraphItemCurrentNonSelected:	#C89C9C
GraphItemSelection:		#EEF81C
GraphItemSelectionContrast:	BLACK
GraphItemContentsSelection:	#6E780C
GraphSnapLine:			#5C704D

GraphFlyoutBackgroundFlagOn:	BLACK
GraphFlyoutBackgroundFlagOff:	BLACK
GraphFlyoutEdgeFlagOff:		GREY(0.3)
GraphFlyoutInfo:		GREY(0.1)
GraphFlyoutWarning:		0.2 0.2 0.0
GraphFlyoutError:		0.2 0.0 0.0

GraphDotPinAccent:		GREY(0.3)

GraphCopPreviewBackground:	GREY(0.1)
GraphCopBottomButtonEnabled:	GREY(0.1)

GraphVopConnectorGroupName:	WHITE
GraphVopConnectorBackground:	GREY(0.25)
GraphVopBottomButtonEnabled:	GREY(0.1)
GraphVopBottomButtonDisabled:	GREY(0.6)

GraphShopConnectorBackground:	GREY(0.1)

GraphSubnetShadow1:		BLACK
GraphSubnetShadowBlend1:	0.6
GraphSubnetShadow2:		WHITE
GraphSubnetShadowBlend2:	0.3

GraphErrorBadgeDot:		1.00 0.00 0.00
GraphChildErrorBadgeDot:	1.00 0.00 0.00
GraphWarningBadgeDot:		0.77 0.60 0.04
GraphCommentBadgeDot:		0.15 0.67 0.64
GraphNodeLockedBadgeDot:	1.00 0.35 0.43
GraphNodeUnloadBadgeDot:	0.60 0.65 0.73
GraphNodeHasDataBadgeDot:	0.45 0.75 0.45
GraphNeedsCookBadgeDot:		0.97 0.91 0.11
GraphHdaLockedBadgeDot:		0.43 0.47 0.48
GraphHdaUnlockedBadgeDot:	0.98 0.49 0.55
GraphTimeDependentBadgeDot:	0.72 0.91 0.53
GraphVexCachedBadgeDot:		#FF5AD2
GraphVexCachableBadgeDot:	#AA3E8C
GraphNotCompilableBadgeDot:	#E5B985
GraphConstraintsBadgeDot:	#97C473
GraphKinematicsBadgeDot:	#FF9370
GraphHasTakeDataBadgeDot:	#979797
GraphNodeUnloadBadgeDot:        #D19F9F
GraphNodeHasDataBadgeDot:       #9FABD1
Graph64bitBadgeDot:       	#AC68CC
GraphPdgDynamicBadgeDot:    #E5C8FF

GraphPdgProgressOutline:	WHITE
GraphPdgProgressPrecook:	#324D59
GraphPdgProgressCooking:	#B8E986
GraphPdgProgressCooked:		#4D623F
GraphPdgProgressWarning:	#EBF802
GraphPdgProgressError:		#FF3300
GraphPdgProgressIncomplete: #75876A

GraphPdgProgressErrorCircle: #D0021B
GraphPdgProgressErrorFill:  #730000
GraphPdgProgressNormalFill:  #232323

GraphPdgSummaryBackground:  GREY(0.18)
GraphPdgSummaryFilterOn:    #FFD42A
GraphPdgSummaryWorkItemCooked:		#73945D
GraphPdgSummaryWorkItemCooking:		#B8E986
GraphPdgSummaryWorkItemWaiting:		#879889
GraphPdgSummaryWorkItemUncooked:	GREY(0.5)
GraphPdgSummaryWorkItemFailed:		#EE5A6C
GraphPdgSummaryWorkItemCancelled:	#EBB502

GraphTaskGraphBackground:			GREY(0.1)
GraphTaskGraphBorder:				GREY(0.7)
GraphTaskGraphSeeMore:				GREY(0.9)
GraphTaskGraphWorkItemCooked:		#529232
GraphTaskGraphWorkItemCached:		#529232
GraphTaskGraphWorkItemCooking:		#ADFF49
GraphTaskGraphWorkItemWaiting:		#354B60
GraphTaskGraphWorkItemUncooked:		GREY(0.5)
GraphTaskGraphWorkItemFailed:		#FF3300
GraphTaskGraphWorkItemCancelled:	#69511B
GraphTaskGraphWorkItemSelected:		#FFD42A
GraphTaskGraphWorkItemHovered:		#33EEFF
GraphTaskGraphWorkItemAncestor:		#99FF79
GraphTaskGraphWorkItemDescendant:	#2AFFCB
GraphTaskGraphNormalWire:			GREY(0.9)
GraphTaskGraphMappedWire:			#80FFA2
GraphTaskGraphIndirectWire:			#D9DD70

GraphTaskGraphWorkItemPerfFast:     #009166
GraphTaskGraphWorkItemPerfMed:      #f6ff00
GraphTaskGraphWorkItemPerfSlow:     #ff9000
GraphTaskGraphWorkItemPerfNA:		GREY(0.35)

GraphTaskGraphStatusBarFailed:	    #FF9C9C
GraphTaskGraphStatusBarCancelled:   #F7DF1B
GraphTaskGraphStatusBarCooked:	    #529232
GraphTaskGraphStatusBarCooking:	    #B7DF86
GraphTaskGraphStatusBarWaiting:	    GREY(0.6)
GraphTaskGraphStatusBarEmpty:	    GREY(0.2)

GraphTopBottomButtonEnabled:	GREY(0.1)
GraphTopBottomButtonDisabled:	GREY(0.6)

GraphLopLayerOutline:		GREY(0.6)
GraphLopLayerColor1:		0.30 0.70 0.20
GraphLopLayerColor2:		0.60 0.40 0.20
GraphLopLayerColor3:		0.90 0.10 0.20
GraphLopLayerColor4:		0.30 0.20 0.30
GraphLopLayerColor5:		0.60 0.20 0.60
GraphLopLayerColor6:		0.90 0.20 0.90
GraphLopLayerColor7:		0.20 0.70 0.30
GraphLopLayerColor8:		0.20 0.40 0.60
GraphLopLayerColor9:		0.20 0.10 0.90
