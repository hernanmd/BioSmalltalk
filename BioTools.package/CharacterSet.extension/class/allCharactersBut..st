*BioTools
allCharactersBut: aCollection
	" Answer a set containing all characters except
	all those contained in aCollection "

	| set |
	set := self empty.
	32 to: 255 do: [ :ascii | 
		| newChar |
		(aCollection includes: (newChar := Character value: ascii))
			ifFalse: [ set add: newChar ] ].
	^ set