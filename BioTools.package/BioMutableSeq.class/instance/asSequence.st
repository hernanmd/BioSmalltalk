converting
asSequence
	" Answer a copy of the receiver converted to a read-only object "
	
	^ BioSequence
		newWith: self asString copy
		alphabet: self alphabet class