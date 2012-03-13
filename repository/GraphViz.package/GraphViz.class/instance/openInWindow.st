converting
openInWindow

	| morph window scrollPane |
	
	morph := self asMorph.
	scrollPane := ScrollPane new.
	scrollPane scroller addMorph: morph.
	
	window := (SystemWindow labelled: self name) model: nil.
	window bounds: (morph position - (0 @ window labelHeight + window borderWidth) corner: morph bottomRight + window borderWidth).
	
	window
		addMorph: scrollPane
		frame: (0 @ 0 extent: 1 @ 1).
		
	window setWindowColor: Color lightOrange lighter lighter.
	window openInWorld.
	
	^ window	