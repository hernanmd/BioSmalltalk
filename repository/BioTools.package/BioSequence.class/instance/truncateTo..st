accessing
truncateTo: endInteger
	" Modify the receiver slicing the sequence from the beggining up to endInteger position.
	The endInteger is inclusive, " 
	
	^ self 
		initializeWith: ( self subSeqFrom: 1 to: endInteger )
		alphabet: self alphabet
	
	