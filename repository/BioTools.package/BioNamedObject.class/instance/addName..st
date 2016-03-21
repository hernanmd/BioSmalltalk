accessing
addName: aString
	" Add aString as a name of the receiver. "
	
	^ (self names includes: aString)
		ifFalse: [ 
			self names addLast: aString.
			self removeNullName ]
		ifTrue: [ self signalDuplicateObject: aString , ' already exists in the receiver' translated ]