accessing
truncateFrom: startInteger to: endInteger
	" Modify the receiver slicing the sequence from startInteger position up to endInteger position.
	The startInteger and endInteger are inclusive, i.e. #copyFrom: 1 to: 2 answer the first two bases of the sequence. " 
	
	^ self 
		initializeWith: (self subSeqFrom: startInteger to: endInteger)
		alphabet: self alphabet
	
	