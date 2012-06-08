accessing
serialize: anObject

	| fileName serialization |
	
	fileName := anObject name withoutBlanks , self currentSeconds , '.obj'.
	self gtLog: 'Serializing...' translated.
	serialization := ( self for: fileName ) serialize: anObject.
	self gtLog: 'done' translated.
	^ serialization
	