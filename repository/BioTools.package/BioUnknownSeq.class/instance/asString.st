accessing
asString
	" Answer a String with the receiver's sequence "
	
	^ self 
		generateJoin: self unknownLetter 
		repeat: self size