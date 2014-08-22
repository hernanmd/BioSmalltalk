printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	self contents isNil
		ifTrue: [ aStream nextPutAll: 'Empty Blast Filter' ]
		ifFalse: [ self printBlastFilterOn: aStream ]