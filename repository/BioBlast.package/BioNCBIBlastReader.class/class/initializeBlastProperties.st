initialize-release
initializeBlastProperties
	" Private - Initialize the receiver blast properties "

	| parser |
	
	BlastProperties := OrderedCollection new.
	parser := (STextParser on: self prvBlastProperties) delimiter: $;.
	parser rowsDo: [: row | self addProperty: (self newProperty: row)]
