converting
asString
	" Answer a <String> with the receiver's sequence "
	
	^ self generateJoin: self motif repeat: self repeats
