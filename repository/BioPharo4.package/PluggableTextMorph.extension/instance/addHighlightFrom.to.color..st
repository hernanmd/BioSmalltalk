*BioPharo4
addHighlightFrom: start to: end color:  col

	self highlights add: (
		(BioTextHighlight on: self)
			color: col;
			lineRange: (start to: end))