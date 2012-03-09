accessing
serialize: anObject

	| fileName |
	
	fileName := anObject name withoutBlanks , self currentSeconds , '.obj'.
	^ ( self for: fileName ) serialize: anObject