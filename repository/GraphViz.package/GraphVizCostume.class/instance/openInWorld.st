displaying
openInWorld

	| graphHeight pasteUp scrollPane window desiredExtent |
	graph doLayout.
	scrollPane := ScrollPane new.
	
	pasteUp := PasteUpMorph new.
	pasteUp extent: ((graph extent scaleBy: 1.2 @ 1.2) asIntegerPoint max: 300 @ 300).
	pasteUp color: Color transparent.
	pasteUp borderWidth: 0.
	scrollPane scroller addMorph: pasteUp.
	
	graphHeight := graph extent y.
	graph allNodesDo:
		[:each | | costume |
		
		costume  := each shape = #box ifTrue: [NCTextRectangleMorph new] ifFalse: [NCEllipseMorph new].
		costume color: Color white.
		self nodes at: each put: costume.
	
		each style = #filled ifTrue: [costume color: (GraphViz colors at: each fillcolor)].

		costume setAllFontsTo: (TextStyle default fontOfSize: each fontSize).
		costume firstEmptyTextMorph
			margins: 5 @ 0;
			contents: each id asString.
		costume center: each x @ (graphHeight - each y).
		pasteUp addMorphBack: costume].

	graph allEdgesDo:
		[:each | | connector |
		connector := NCAAConnectorMorph 
			fromMorph: (self nodes at: each fromNode)
			toMorph: (self nodes at: each toNode).
			
		connector beSmoothCurve.
		"connector beOrthogonal: true."
		
		graph isDirected ifTrue: 
			[(each arrowtail ~= #none and: [each arrowhead ~= #none])
				ifTrue: [connector makeBothArrows]
				ifFalse: 
					[each arrowhead ~= #none
						ifTrue: [connector makeForwardArrow]
						ifFalse: [connector makeBackArrow]]].
		
		connector lineWidth: 1.
		connector arrowScales: 0.75.
		connector setVertices: (each vertices collect: [:vertex | vertex x @ (graphHeight - vertex y)]).
		self edges add: connector].
	
	window := (SystemWindow labelled: graph name) model: nil.
	desiredExtent := pasteUp extent + ((window borderWidth * 2) @ (window borderWidth * 2 + window labelHeight)).
	
	window extent: ((desiredExtent max: 300 @ 300) min: 800 @ 800).
	
	window
		addMorph: scrollPane
		frame: (0 @ 0 extent: 1 @ 1).	
	window setWindowColor: Color lightOrange lighter lighter.
	window openAsIs.