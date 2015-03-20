accessing
newMatchingDictionary: keySymbol
	" Private - Answer a <Dictionary> for storing matches or mismatches in the receiver "

	^ Dictionary new 
		at: keySymbol put: OrderedCollection new;
		yourself