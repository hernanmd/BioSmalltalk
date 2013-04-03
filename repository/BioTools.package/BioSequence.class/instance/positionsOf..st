accessing
positionsOf: aCharacterOrString
	" Answer a Collection with the positions of aminoacidLetter in the receiver's sequence "
	
	| positions inputLetter |
	
	inputLetter := aCharacterOrString asAminoacidLetter.
	positions := OrderedCollection new.
	seq withIndexDo: [ : letter : index |
		letter = inputLetter
			ifTrue: [ positions add: index ] ].
	^ positions