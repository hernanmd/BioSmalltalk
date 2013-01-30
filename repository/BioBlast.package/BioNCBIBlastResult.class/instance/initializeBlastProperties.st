initialize-release
initializeBlastProperties
	" Private - Initialize the receiver blast properties "

	| parser |
	
	parser := (STextParser on: self class blastProperties) delimiter: $;.
	parser rowsDo: [: row | self addProperty: (self newProperty: row)]
