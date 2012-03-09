convenience
joinSequence: aCollection
	" Private - Answer a String with the sequence ensambled from aCollection.
	aCollection is a collection of collections with each element composed by
	Strings or Characters "
	
	^ ( aCollection 
			gather: [: each | 
				each select: [: elem | elem isBiologicalSequence ] ] ) joinUsing: String empty