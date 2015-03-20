private
writeOn: aStream
	" Write the receiver's section on aStream "

	self writeLabelOn: aStream.
	self associationsDo: [ :assoc | 
		" Label key case "
		aStream tab;
			nextPutAll: assoc key;
			nextPut: $=.
		assoc value isString 
			ifTrue: [ self writeQuoted: assoc on: aStream ]					" Value case "
			ifFalse: [ self writeGroups: assoc on: aStream ]					" Groups case "
		]