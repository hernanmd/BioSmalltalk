*biopharo
buildWindowFor: anObject label: label

	| window listMorph |
	
	window := (self windowHost labelled: label) model: self.
	window 
		addMorph: (listMorph := self explorerListMorph)
		frame: (0@0 corner: 1@0.8).
	window 
		addMorph: self explorerCodeMorph
		frame: (0@0.8 corner: 1@1).
	listMorph autoDeselect: false.
     ^ window