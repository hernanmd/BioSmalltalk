private
writeOn: aStream
	" Private - Write the receiver's title and key/value pairs in aStream "
	
	self writeLabelOn: aStream.
	self associationsDo: [ :assoc | 
		aStream 
			tab;
			nextPutAll: assoc key;
			nextPut: $=.
		self writeQuoted: assoc on: aStream ]