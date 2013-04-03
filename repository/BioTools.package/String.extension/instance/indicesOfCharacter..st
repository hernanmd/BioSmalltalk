*BioTools
indicesOfCharacter: aCharacter
	" Given anAsciiInteger of a Character contained in the receiver, answer a Collection of positions where the Character is found "
	
	| indices |

	indices := OrderedCollection new: self size.
	1 to: self size do: [ : pos |
		(self at: pos) asciiValue = aCharacter asciiValue ifTrue: [ indices addLast: pos ] ].
	^ indices