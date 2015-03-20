copying
copyFrom: startInteger to: endInteger
	" Answer a copy of the receiver sliced from startInteger position up to endInteger position.
	The startInteger and endInteger are inclusive, i.e. #copyFrom: 1 to: 2 answer the first two bases of the sequence. " 
	
	^ self newPrototypeWith: (self subSeqFrom: startInteger to: endInteger)
	
	