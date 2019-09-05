Extension { #name : #PluggableTextMorph }

{ #category : #'*BioPharo4' }
PluggableTextMorph >> addHighlightColors: colors [

	self highlights add: (
		(BioTextHighlight on: self)
			colors: colors;
			lineRange: (1 to: self text size))
]

{ #category : #'*BioPharo4' }
PluggableTextMorph >> addHighlightFrom: start to: end color:  col [

	self highlights add: (
		(BioTextHighlight on: self)
			color: col;
			lineRange: (start to: end))
]
