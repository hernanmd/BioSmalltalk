*BioPharo4
addHighlightColors: colors

	self highlights add: (
		(BioTextHighlight on: self)
			colors: colors;
			lineRange: (1 to: self text size))