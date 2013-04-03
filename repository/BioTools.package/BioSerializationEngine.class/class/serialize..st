accessing
serialize: anObject

	| fileName serialization |
	
	fileName := anObject name withoutBlanks , self currentSeconds , '.obj'.
	self bioLog: 'Serializing...' translated.
	serialization := (self for: fileName) serialize: anObject.
	self bioLog: 'done' translated.
	^ serialization
	