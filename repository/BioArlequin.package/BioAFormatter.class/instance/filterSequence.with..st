convenience-filtering
filterSequence: referenceSequence with: hitSequence
	" Answer a String resulting of comparing 
		referenceSequence and hitSequence replacing with
		missingDataCharacter when no hit found in the current
		position.
		
		referenceSequence and hitSequence must be both equal sizes "

	^ String streamContents: [: str |		
			referenceSequence with: hitSequence do: [ : refChar : hitChar |
				hitChar isEmpty
					ifFalse: [ self filterSequence: refChar using: hitChar in: str ]
					ifTrue: [ str nextPutAll: self outputFile profileSection missingData value ] ] ].