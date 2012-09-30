converting
asString
	" Answer a String with the receiver's sequence "
	
	^ BioObject 
		generateJoin: self unknownLetter 
		repeat: self size