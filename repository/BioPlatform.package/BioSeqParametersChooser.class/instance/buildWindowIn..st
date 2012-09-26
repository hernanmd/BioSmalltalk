user interface
buildWindowIn: window

	| editor statusViewHeight |
	
	editor := self sequenceEditorIn: window.
	statusViewHeight := 100.
	window 
		addMorph: editor
		fullFrame: (LayoutFrame 
				fractions: ( 0.01 @ 0.25 corner: 0.5 @ 0.5 )
				offsets: (0 @ statusViewHeight negated corner: 0 @ 0)).
