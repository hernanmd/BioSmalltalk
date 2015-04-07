accessing
serialize: anObject
	" Check and correct, if necessary, anObject's name before serializing into a file "

	| fileName serialization |
	
	(fileName := anObject name withoutBlanks) size > 100 
		ifTrue: [ fileName := anObject class asString. ].
	fileName := fileName ,  '_' , self currentSeconds , '.obj'.
	self bioLog: 'Serializing...' translated.
	serialization := (self for: fileName) serialize: anObject.
	self bioLog: 'done' translated.
	^ serialization
	