accessing
truncateFrom: startInteger
	" Modify the receiver slicing the sequence from startInteger position up to the last position.
	The startInteger is inclusive " 
	
	^ self 
		initializeWith: (self subSeqFrom: startInteger to: self size)
		alphabet: self alphabet
	
	