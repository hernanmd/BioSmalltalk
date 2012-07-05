printing
printOn: aStream
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	organization
		ifNotNil: [ self printClassificationsOn: aStream ]
