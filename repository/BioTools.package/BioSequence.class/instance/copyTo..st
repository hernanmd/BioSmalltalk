accessing
copyTo: stopInteger
	" Answer a copy of the receiver sliced from the first position up to the stopInteger position.
	The startInteger and endInteger are inclusive, i.e. #copyFrom: 1 to: 2 answer the first two bases of the sequence. " 
	
	^ self newPrototypeWith: ( self subSeqFrom: 1 to: stopInteger )
	
	