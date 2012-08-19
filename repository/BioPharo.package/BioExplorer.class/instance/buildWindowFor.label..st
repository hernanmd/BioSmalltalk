user interface
buildWindowFor: anObject label: label

	| window listMorph toolbar |
	
	window := (self windowHost labelled: label) model: self.
	toolbar := self buildSearchModeToolBar: window.
	window 
		addMorph: toolbar
		frame: (0@0 corner: 1@0.04).
	window 
		addMorph: (listMorph := self explorerListMorph)
		frame: (0@0.04 corner: 1@0.8).
	window 
		addMorph: self explorerCodeMorph
		frame: (0@0.8 corner: 1@1).
	listMorph autoDeselect: false.
     ^ window