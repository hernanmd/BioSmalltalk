converting
asMutableSequence
	" Answer a copy of the receiver converted to a mutable object "
	
	^ BioMutableSeq 
		newWith: self asString copy
		alphabet: self alphabet class
